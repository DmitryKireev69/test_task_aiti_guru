import pytest

@pytest.mark.parametrize(
    'data, expected_status',
    [
        ({'order_id': 3, 'product_id': 2, 'count':1}, 201),
        ({'order_id': 0}, 422),
        ({'order_id': 3, 'product_id': 2, 'count':0}, 422),
        ({}, 422),
        ({'order_id': ''}, 422),
        ({'order_id': 0, 'product_id': 0, 'count':2}, 404),
    ]
)
@pytest.mark.asyncio
async def test_create_product_in_order(data, expected_status, client):
    response = await client.post('/products', json=data)
    assert response.status_code == expected_status
    if expected_status == 422:
        assert 'detail' in response.json()
    elif expected_status == 201:
        json_data = response.json()
        assert 'order_id' in json_data
        assert 'product_id' in json_data


        assert isinstance(json_data['order_id'], int)
        assert isinstance(json_data['product_id'], int)
        if 'created_at' in json_data:
            assert isinstance(json_data['created_at'], str)
