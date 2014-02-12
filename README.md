#Twitter Search Web Application

preview

<http://health-searche.herokuapp.com>

##Use Application in Heroku

    git clone git@github.com:soramugi/twitter_search.git
    cd twitter_search
    heroku create
    heroku config:add SEARCH_WORD='健康になりたい'
    heroku cojfig:add CONSUMER_KEY='YOUR_CONSUMER_KEY'
    heroku config:add CONSUMER_SECRET='YOUR_CONSUMER_SECRET'
    git push heroku master
    heroku open
