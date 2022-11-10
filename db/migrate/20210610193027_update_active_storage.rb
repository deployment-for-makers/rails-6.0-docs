# This migration comes from active_storage (originally 20190112182829)
class UpdateActiveStorage < ActiveRecord::Migration[6.0]
  def up
    unless column_exists?(:active_storage_blobs, :service_name)
      add_column :active_storage_blobs, :service_name, :string

      if configured_service = ActiveStorage::Blob.service.name
        ActiveStorage::Blob.unscoped.update_all(service_name: configured_service)
      end

      change_column :active_storage_blobs, :service_name, :string, null: false
    end

    create_table :active_storage_variant_records do |t|
      t.belongs_to :blob, null: false, index: false
      t.string :variation_digest, null: false

      t.index %i[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end

  def down
    remove_column :active_storage_blobs, :service_name
    drop_table :active_storage_variant_records, if_exists: true, force: true
  end
end
