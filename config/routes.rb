###
# Patch to allow split routes to smaller files as it was removed from Rails.
# https://github.com/rails/rails/commit/5e7d6bba79393de0279917f93b82f3b7b176f4b5
#------------------------------------------------------------------------------
class ActionDispatch::Routing::Mapper
  def draw(route)
    instance_eval File.read(Rails.root.join "config/routes/#{route}.rb")
  end
end

###
# Draw application routes
#------------------------------------------------------------------------------
Rails.application.routes.draw do
  # As we have one namespace (application) we don't need it, but if we will have
  # more namespace (say devise, admin, investor, borrower, etc...) then it might
  # be helpfull.
  %i(investor).each { |route| draw route }
end
