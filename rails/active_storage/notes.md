
## active storage

- upload files to a cloud storage service like s3 or blob storage

### dependencies

### setup

rails active_storage:install : generates a migration to create tables

- db
  + active_storage_blobs
  + active_storage_variant_records
  + active_storage_attachments : polymorphic that attaches blobs to your models (if model name changes, SQL update is required)

- config/storage.yml : define provider's configuration

- config/environment/*.rb : tell the environment which provider to use
  + config.active_storage.service = :local
  + config.active_storage.service = :cloudinary

- mirror service : replicate data between two or more services / providers
  + use for tmp migration between services

- public access
  + by default, rails assumes all the services are private (signed, single-use urls for blobs)
  + set public: true on config to change this