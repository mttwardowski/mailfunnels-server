class CreateFunnelModels < ActiveRecord::Migration[5.0]
  def change
    create_table :funnel_models do |t|

      t.timestamps
    end
  end
end
