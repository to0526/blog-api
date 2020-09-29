require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = FactoryBot.create(:article)
    @user = FactoryBot.create(:user)
    @headers = { "Authorization": "Token #{@user.token}" }
  end

  test "should get index" do
    get articles_url, as: :json
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: {
        article: { body: @article.body, title: @article.title }
      }, as: :json, headers: @headers
    end
    assert_response 201

    post articles_url, params: {
      article: { body: @article.body, title: @article.title }
    }, as: :json
    assert_response 401
  end

  test "should show article" do
    get article_url(@article), as: :json
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: {
      article: { body: @article.body, title: @article.title }
    }, as: :json, headers: @headers
    assert_response 200

    patch article_url(@article), params: {
      article: { body: @article.body, title: @article.title }
    }, as: :json
    assert_response 401
  end

  test "should destroy article" do
    delete article_url(@article), as: :json
    assert_response 401

    assert_difference('Article.count', -1) do
      delete article_url(@article), as: :json, headers: @headers
    end
    assert_response 204
  end
end
