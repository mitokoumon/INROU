class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products, dependent: :destroy
  accepts_nested_attributes_for :ordered_products

  validates :address,:name,:payment, presence: true
  validates :post_code,length:{is:7}

  # orderのデータと同時にordered_productsのデータを保存する際に必要
  # 注文をcreateする時に注文商品を一緒に作成するために必要
  # http: //pistachio0416.hatenablog.com/entry/2015/02/16/1%E5%AF%BE%E5%A4%9A%E3%81%AE%E9%96%A2%E4%BF%82%E3%81%A7%E5%90%8C%E6%99%82%E3%81%AB%E4%BD%9C%E6%88%90/%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B（paramsの書き方が間違ってるacount→acounts以外はここ見ればわかる)
end
