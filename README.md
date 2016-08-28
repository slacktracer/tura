# tura
The Ultimate Ruby Application

This is part of an exercise. This is the part I focused the most. Mostly because it was/is the part I know the least (if at all).

It is an application to register unique visitor to some site. It receives data from a JS library (https://github.com/slacktracer/trekker). You can see a list of unique visitor identified by an ID and an e-mail (if the latter has been collected already) and you have a page for each visitor with data about visited pages. That's pretty much it.

Having never written a single line of Ruby before I think the end result could have been a lot worse. =P

Right before starting this project I started reading a nice book called Learn Ruby the Hard Way (https://learnrubythehardway.org/). I highly recommend it. Even (or specially) if you have never did any programming before.

I did not have opportunity to use many of the lessons learned, it gave me a solid base to start understanding Ruby and its specificities.

## How to Run It Locally

If you came to this almost 90 percent Ruby repository you probably know more Ruby than I do right now. All I did to run it was having ruby installed get to this project diretory and run:

```sh
$ ruby main.rb
```

It is *important that it is running on localhost:4567* because its sister library expects to talk to it there (again, https://github.com/slacktracer/trekker).

## Testing

I believe this chapter of Learn Ruby the hard Way is simplest, easiest way to start learning and writing automated tests wirth Ruby that you'll find on the internet: https://learnrubythehardway.org/book/ex47.html.

But I had not got there by the time I wrote this application. So I improvised.

You can run a few tests like this:

```sh
$ ruby test.rb
```

There are three unit tests (in essence) that I wired myself, trying to stay true to the idea of units testing but without using any specific library or framework.

I am sure it could use a few more tests. But then again, I blaming everything on the time constrainsts! =P
