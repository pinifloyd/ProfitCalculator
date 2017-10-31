# Environment

* ruby 2.4.2
* rails 5.1.4
* postgresql 9.5

# Configure Application (DEV)

Copy database.yml and configure for your needs

```
cp config/database.yml.example config/database.yml
```

Create Database

```
rails db:create
```

Run Migrations

```
rails db:migrate
```

Run Seeds

```
rails db:seed
```

Or You Can Use One Command

```
rails db:create && rails db:migrate && rails db:seed
```

# Start Application (DEV)

Start Database

```
postgres -D /usr/local/var/postgres
```

Start Application

```
rails s
```

# NOTES:

* Yarn was skipped as I want to use AssetPipeline

# TODO:

* Create Periods (jsonb field or class)
