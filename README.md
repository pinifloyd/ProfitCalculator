# Environment

* rbenv 1.1.1
* ruby 2.4.2
* rails 5.1.4
* postgresql 9.5

# Prepare Env for App

Install Ruby (Optional rbenv or rvm). Then create gemset:

```
rbenv gemset create 2.4.2 ProfitCalculator
```

Install bundler:

```
gem install bundler
```

Install required gems:

```
bundle install
```

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

# Deploy

See SERVER.md, then use next command:

```
cap cap production deploy:start
```

Or the same but for another branch then master

```
cap production deploy:start BRANCH=your-branch-name
```

# NOTES:

* Yarn was skipped as I want to use AssetPipeline
