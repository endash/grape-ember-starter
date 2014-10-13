Grape Ember Starter
===================

This is intended to be a super light-weight drop-in data harness for quickly getting ember apps up to speed with something more complex than mocks or fixtures.

Based off of @dblock's [Grape-on-Rack](https://github.com/dblock/grape-on-rack). Many props to that project.

Standard warnings apply: not production ready, etc, etc. 

The eventual intended stack is:

* [Rack](https://github.com/rack/rack)
* [Grape](https://github.com/intridea/grape), a framework for rapid creation of APIs
* [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord), for the ORM and database related rake tasks
* [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers), which natively supports the format expected by Ember Data
* [Omniath](https://github.com/intridea/omniauth), for third party authentication support

This project is intended for Ruby-Ember devs who want:

* a drop-in back-end for development and test purposes, that is more complex than a fixtures environment but not as complex or demanding as a full back-end app.
* a turnkey backend for non-critical hobby or internal projects. Use at your own risk.
* a Ruby-based development environment that can be supplanted by or integrated into a full back-end app when project conditions warrent.

