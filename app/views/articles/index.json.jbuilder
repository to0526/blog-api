json.array! @articles do |article|
  json.(article, :title, :body)
  json.created_at I18n.l(article.created_at, format: :long)
end
