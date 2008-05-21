require 'redmine'

# Patches to the Redmine core.  Will not work in development mode
require_dependency 'issue_patch'
require_dependency 'query_patch'

RAILS_DEFAULT_LOGGER.info 'Starting Budget plugin for RedMine'

Redmine::Plugin.register :budget_plugin do
  name 'Budget'
  author 'Eric Davis <edavis@littlestreamsoftware.com>'
  description 'This is a budget plugin to track deliverables and budgets on a project'
  version '0.0.0'
  
  settings :default => {
    'budget_nonbillable_overhead' => '',
    'budget_materials' => '',
    'budget_profit' => ''
  }, :partial => 'settings/settings'

  
  project_module :budget_module do
    permission :view_budget, { :deliverables => [:index]}
    permission :manage_budget, { :deliverables => [:new, :edit, :create, :update, :destroy, :preview]}
  end
  
  menu :project_menu, :budget, :controller => "deliverables", :action => 'index'
end


