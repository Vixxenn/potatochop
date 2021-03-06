require 'helper'

def app
  Potatochop::Web
end

describe 'Potatochop' do
  describe 'Web' do
    app.set(:tater => Potatochop::Spud.new(Potatochop::FileSystemInterface.new('spec/fake_mockups')))
    include Rack::Test::Methods

    it 'returns an error when a haml page does not exist' do
      get 'no_exist.html'
      expect(last_response).to_not be_ok
    end

    it 'renders a haml page that exists' do
      get '/foo.html'
      expect(last_response.body).to match('<h1>\s+This is an H1!\s+</h1>')
    end

    it 'renders an html page that exists' do
      get '/bar.html'
      expect(last_response.body).to match('This page is static HTML')
    end

    it 'returns an error when a sass file does not exist' do
      get 'no_exist.css'
      expect(last_response).to_not be_ok
    end

    it 'renders a sass stylesheet that exists' do
      get '/css/foo.css'
      expect(last_response.body).to match('body h1 {\s+color: red; }')
    end

    it 'renders a sass stylesheet (with a mixin) that exists' do
      get '/css/mixin_example.css'
      expected_response = <<-VRSA
body h1 {
  background-color: red;
  border-radius: 3px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px; }
VRSA
      expect(last_response.body).to eq(expected_response)
    end

    it 'renders a static stylesheet that exists' do
      get '/css/bar.css'
      expect(last_response.body).to match('body h1 { color: blue; }')
    end

    it 'returns an error when a requested image file does not exist' do
      get 'no_exist.png'
      expect(last_response).to_not be_ok
    end

    it 'returns a requested image file when it exists' do
      get '/img/potatochop_cs4_box.png'
      expect(last_response).to be_ok
    end

    it 'returns an error when a requested javascript file does not exist' do
      get '/no_exist.js'
      expect(last_response).to_not be_ok
    end

    it 'returns the requested javascript file if it exists' do
      get '/js/bar.js'
      expect(last_response).to be_ok
    end

    it 'returns the requested font file, if it exists' do
      get '/css/fonts/brawler-webfont.woff2'
      expect(last_response).to be_ok
    end
  end
end
