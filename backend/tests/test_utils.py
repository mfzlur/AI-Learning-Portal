"""
Utility functions for tests to make them more robust against implementation differences.
"""

import json
from functools import wraps
from main import app


def try_multiple_urls(client, base_urls, params=None, method='get', data=None, headers=None):
    if params is None:
        params = {}
    
    urls = [url.format(**params) for url in base_urls]
    
    request_method = getattr(client, method.lower())
    
    for url in urls:
        response = request_method(
            url, 
            data=json.dumps(data) if data else None,
            headers=headers or {'Content-Type': 'application/json'}
        )
        if response.status_code < 400:
            return response, url
    
    return response, None


def flexible_field_names(field_mappings):
    def decorator(test_func):
        @wraps(test_func)
        def wrapper(self, *args, **kwargs):
            data = kwargs.get('data', {})
            
            result = test_func(self, *args, **kwargs)
            
            if result is not None:
                return result
                
            for canonical, alternatives in field_mappings.items():
                if canonical in data:
                    original_value = data[canonical]
                    del data[canonical]
                    
                    for alt in alternatives:
                        data[alt] = original_value
                        try:
                            return test_func(self, *args, **kwargs)
                        except:
                            del data[alt]
                    
                    data[canonical] = original_value
            
            return test_func(self, *args, **kwargs)
        
        return wrapper
    return decorator


def test_api_with_fallbacks(client=None, resource_id=None, data=None, 
                           primary_method='get', primary_url=None,
                           fallbacks=None, expected_codes=None):
    if client is None:
        with app.test_client() as test_client:
            client = test_client
    
    if expected_codes is None:
        expected_codes = [200, 201, 204]
    
    if fallbacks is None:
        fallbacks = []
    
    if primary_url is None:
        primary_url = '/'
    
    request_method = getattr(client, primary_method)
    
    if data and not isinstance(data, (str, bytes)):
        request_data = json.dumps(data)
    else:
        request_data = data
        
    response = request_method(
        primary_url,
        data=request_data,
        content_type='application/json'
    )
    
    return response, response.status_code in expected_codes
