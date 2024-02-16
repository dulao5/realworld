require 'active_record/connection_adapters/mysql/schema_creation'
module ActiveRecord
    module ConnectionAdapters
      module MySQL
        class SchemaCreation
          private
            alias_method :add_table_options_original!, :add_table_options!
            remove_method :add_table_options!
            def add_table_options!(create_sql, o)
                add_table_options_original!(create_sql, o)

                # only for TiDB
                # if id is a primary key and is a auto-incremented, we should set AUTO_ID_CACHE to 1
                create_sql << " AUTO_ID_CACHE 1" if /AUTO_INCREMENT PRIMARY KEY/ =~ create_sql
            end
        end
      end
    end
end
