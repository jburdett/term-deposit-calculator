# term-deposit-calculator

This project is a simple term deposit calculator.

## Setup

This project was built with ruby version `3.1.2`

Bundle the required gems 

```
bundle install
```

To run the application:

```
bundle exec ruby bin/run.rb
```

To run the tests:

```
bundle exec rspec
```

## Assumptions

Input validation is following the example calculator given at https://www.bendigobank.com.au/calculators/deposit-and-savings/  
Output correctness was also measured against the calculator in the link  
Input has the following conditions:

* Starting amount is a dollar value between $1000 - $1,000,000
* Interest rate is a percentage value between 0% - 5%
* Investment term is the number of months between 3 - 60 (3 months - 5 years)
* Interest frequency has 4 options of Monthly, Quarterly, Annually and At Maturity
