[Code Climate](https://codeclimate.com/github/brendanboyle87/seal-cori.png) [![Coverage Status]

#SealCORI

SealCORI is an application that helps individuals with a criminal history in
Massachusetts determine if they are eligible to seal their criminal records. The app leads
users through a multi-part form, determines their eligibility, and if eligible
inserts their information into the State PDF form using the pdftk-binary
and pdf-forms gem.  

## Live app hosted on Heroku
[SealCORI](www.sealcori.com)

## Ruby Version
2.2.2

## System dependencies and setup

1. Bundle the gems

  ```
  Bundle

  ```

2. Bootup the database:

  ```
  rake db:create
  ```

3. Bring in your migrations

  ```
  rake db:migrate
  ```

4.  Seed the database

  ```
  rake db:seed

  ```

4. Run the test suite

  ```
  rake
  ```
To create PDFs locally you will need to download the PDFTK binary from [PDFLabs](https://www.pdflabs.com/tools/pdftk-server/) and store the binary at /usr/local/bin/pdftk. If you wish to store it in a different place you will need to change the path in the PDF Generator Model.

## Deployment

On a clean Master branch, run:

  ```
  git push heroku master
  heroku run rake db:migrate
  heroku run rake db:seed
  ```
The repository already contains the files necessary to run the PDFTK binary in production.
In order for the binary to work on Heroku set the following ENV variables:
```
heroku config:set LD_LIBRARY_PATH=/app/.heroku/vendor/lib:/app/vendor/pdftk/lib
heroku config:set PATH=/app/.heroku/python/bin:/usr/local/bin:/usr/bin:/bin:/app/vendor/pdftk/bin
```
To confirm PDFTK is installed properly on heroku run ```heroku run bash``` then
enter ```pdftk```. You should see the help output from the PDFTK binary.
