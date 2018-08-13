#encoding: utf-8
#REQUIRE:

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


#Get запросы:

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
	erb :about
end

get '/contact' do
	erb :contact
end
get '/visit' do
	erb :visit
end

#POST запросы:

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@master = params[:master]
	@color = params[:color]

	hh = { 	:username  => 'Введите имя',
			:phone => 'Введите телефон',
			:datetime => 'Введите дату', }

	hh.each do |key, value|
		
		if params[key] == ''
			@error = hh[key]

			return erb :visit
		end

	end

	erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@master}, #{@color}"

end