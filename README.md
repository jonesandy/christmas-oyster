<img src="./_imgs/tfl.png" align="right" />

# Christmas oyster

![](https://img.shields.io/badge/Practice-Makers%20Academy-red)
[![Build Status](https://travis-ci.com/jonesandy/christmas-oyster.svg?branch=master)](https://travis-ci.com/jonesandy/christmas-oyster)
[![Maintainability](https://api.codeclimate.com/v1/badges/bd6630c05c609856c242/maintainability)](https://codeclimate.com/github/jonesandy/christmas-oyster/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/bd6630c05c609856c242/test_coverage)](https://codeclimate.com/github/jonesandy/christmas-oyster/test_coverage)   

---

Application to practice TDD and OOP principles. Application mimics TfL's Oystercard scheme and is from the Makers Academy course.

## Getting started

This project requires Ruby version 2.6.5. To check which Ruby version is running on your computer:

```bash
ruby -v
```

If running RVM for Ruby management please install 2.6.5:

```bash
rvm install 2.6.5

# .ruby-version file should switch to correct Ruby version. If not run this command
rvm 2.6.5
```

To install and run program first clone or download.

```bash
git clone
```

Change into the root directory and install dependencies.

```bash
cd christmas-oyster

# Once in root folder
bundle install
```

## User stories

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```

## Tests

To run tests, make sure you are in the root folder, then run RSpec.

```bash
# Inside root folder
rspec
```
