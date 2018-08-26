class InitSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :gender
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # Devise Params
      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      t.string   :email
      t.string   :encrypted_password, default: ""

      t.timestamps
    end

    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :type
      t.string :opening_hour, null: false
      t.string :closing_hour, null: false

      t.timestamps
    end

    create_table :purchases do |t|
      t.float :total, null: false
      t.integer :purchased_product_ids, array: true, default: []
      t.datetime :pickedup_at, null: false

      # belongs_to User
      t.references :user, foreign_key: true
      # belongs_to Restaurant
      t.references :restaurant, foreign_key: true
      t.timestamps
    end

    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :ingredients, array: true, default: []
      t.json :extra_ingredients, default: {} # Ingredient -> price 

      # belongs_to Restaurant
      t.references :restaurant, foreign_key: true
      t.timestamps
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true
    # Recoverable
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    # Confirmable
    add_index :users, :confirmation_token, unique: true
  end
end
