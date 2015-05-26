class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :sid
      t.string :bowtie_id
      t.string :email
      t.string :name
      t.timestamps :created_at
      t.datetime :updated_at

    end
  end
end
