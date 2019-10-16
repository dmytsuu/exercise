# frozen_string_literal: true

describe ProductsController do
  describe '#create' do
    subject { -> { post :create, params: params } }
    # TODO: move to fixtures!
    let(:params) do
      {
        "url": 'https://example.com/dress/435?color=041',
        "product_sku": '435',
        "product_name": 'Sundry Fabian Dress',
        "article_sku": '435_041',
        "article_name": 'NAVY',
        "price": '$148.00',
        "photos": [
          {
            "url": 'https://example.com/images/435_1.jpg'
          },
          {
            "url": 'https://example.com/images/435_2.jpg'
          },
          {
            "url": 'https://example.com/images/435_3.jpg'
          }
        ],
        "sizes": [
          {
            "size_sku": '435_041_4',
            "name": 'XS',
            "available": true
          },
          {
            "size_sku": '435_041_5',
            "name": 'S',
            "available": true
          },
          {
            "size_sku": '435_041_6',
            "name": 'M',
            "available": true
          },
          {
            "size_sku": '435_041_7',
            "name": 'L',
            "available": false
          },
          {
            "size_sku": '435_041_8',
            "name": 'XL',
            "available": false
          }
        ]
      }
    end

    it { is_expected.to change(Product, :count).by(1) }
    it { is_expected.to change(ProductArticle, :count).by(1) }
    it { is_expected.to change(ProductPhoto, :count).by(3) }
    it { is_expected.to change(ProductSize, :count).by(5) }
  end
end
