import pytest
from fastapi.testclient import TestClient
from unittest.mock import patch, MagicMock

# Import the FastAPI app
from app import app, remove_think_content

# Create test client
client = TestClient(app)

# Test data
TEST_QUERY = "Explain eigenvalues"
TEST_LLM_RESPONSE = "This is <think>some internal reasoning</think> the filtered response"
EXPECTED_FILTERED_RESPONSE = "This is the filtered response"

def test_remove_think_content():
    """Test the function that removes content between <think> tags"""
    assert remove_think_content(TEST_LLM_RESPONSE) == EXPECTED_FILTERED_RESPONSE

class TestFastAPIApp:
    """Tests for the FastAPI application"""
    
    @pytest.fixture(autouse=True)
    def setup_and_teardown(self):
        """Reset global variables before and after each test"""
        import main
        original_db = main.db
        original_retriever = main.retriever
        
        # Reset for test
        main.db = None
        main.retriever = None
        
        yield
        
        # Restore original state
        main.db = original_db
        main.retriever = original_retriever
    

    
    @patch('main.OllamaLLM')
    @patch('main.ConversationalRetrievalChain')
    def test_query_endpoint_success(self, mock_chain_class, mock_llm_class):
        """Test query endpoint with successful response"""
        import main
        
        # Setup mocks for db and retriever
        main.db = MagicMock()
        main.retriever = MagicMock()
        
        # Setup mock chain
        mock_chain = MagicMock()
        mock_chain.invoke.return_value = {"answer": TEST_LLM_RESPONSE}
        mock_chain_class.from_llm.return_value = mock_chain
        
        # Make request
        response = client.post("/query", json={"query": TEST_QUERY})
        
        # Assert response
        assert response.status_code == 200
        assert response.json() == {"response": EXPECTED_FILTERED_RESPONSE}
        
        # Verify mock calls
        mock_llm_class.assert_called_once_with(model="llama3.1:8b", temperature=0)
        mock_chain_class.from_llm.assert_called_once()
        mock_chain.invoke.assert_called_once()
        assert mock_chain.invoke.call_args[0][0]["question"] == TEST_QUERY
    
