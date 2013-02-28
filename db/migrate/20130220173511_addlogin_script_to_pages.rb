class AddloginScriptToPages < ActiveRecord::Migration
  def change
    add_column :pages, :login_script, :text, {:limit => 2000}
  end
end
