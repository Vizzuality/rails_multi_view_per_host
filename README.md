# Rails multi view per host #

Given a request, depending on its host, the application should render a set of specific views.

Let's suppose that our domains in production are:

  - example1.com
  - test2.com
  - www.foodomain.com

In order to test with those domains in the development environment we have to add a prefix `localhost.` to the domains:

  - localhost.example1.com
  - localhost.test2.com
  - localhost.www.foodomain.com

Also you have to add them into your `/etc/hosts` file:

    127.0.0.1 localhost.example1.com localhost.test2.com localhost.www.foodomain.com

The way it works is as follow:

  - Each time a request is performed, a before filter `set_site` (maybe the first `before_filter` of your application), will check if the host is valid
  - If so, it will set the new view path, in which search for the view associated to the controller and the action
  - The layout of the action will be automatically picked up, but is **very important** to indicate it in the controller (as you can see at `app/controllers/site_controller.rb` line #3)

Now you can test the following URL's:

  - <http://localhost.example1.com:3000/site/home>
  - <http://localhost.test2.com:3000/site/home>
  - <http://localhost.www.foodomain.com:3000/site/home>

## Javascripts, images and stylesheets

In order to do the same with the static resources, such as images, javascripts and stylesheets, it is possible to create a folder per host. For example:

    public/
     images/
       domain1/
         - image1.png
       domain2/
         - image1.png

    <%= image_tag("images/domain1/image1.png") %>

    or

    <img src="/images/domain1/image1.png" />