# frozen_string_literal: true

describe ProductArticlesController do
  describe '#update' do
    subject { -> { patch :update, params: params } }
    # TODO: move to fixtures!
    let(:params) do
      { "article_sku": '435_041',
        "related_sku": %w[324_021 892_15] }
    end
    let(:product) { Product.create(name: 'name') }
    let!(:product_article) { ProductArticle.create(sku: params[:article_sku], product: product) }
    before do
      params[:related_sku].each do |related_sku|
        ProductArticle.create(sku: related_sku, product: product)
      end
    end
    it { is_expected.to change { product_article.reload.related_articles.count } }
  end
end
