# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "access_passes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "access_passes_permissions", id: false, force: :cascade do |t|
    t.bigint "access_pass_id"
    t.bigint "platform_permission_id"
    t.index ["access_pass_id"], name: "index_access_passes_permissions_on_access_pass_id"
    t.index ["platform_permission_id"], name: "index_access_passes_permissions_on_platform_permission_id"
  end

  create_table "account_engagement_reports", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.date "report_date"
    t.integer "comment_likes_by_client", default: 0
    t.integer "comment_likes_by_ip", default: 0
    t.integer "outgoing_discussions", default: 0
    t.integer "incoming_discussions_from_client", default: 0
    t.integer "incoming_discussions_from_ip", default: 0
    t.integer "incoming_pm_from_client", default: 0
    t.integer "incoming_pm_from_ip", default: 0
    t.integer "insight_likes_by_client", default: 0
    t.integer "insight_likes_by_ip", default: 0
    t.integer "total_followers", default: 0
    t.integer "total_citations", default: 0
    t.integer "total_published_insights", default: 0
    t.integer "total_public_insight_views", default: 0
    t.integer "insight_views_by_client", default: 0
    t.integer "insight_views_by_ip", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_discussions", default: 0
    t.integer "total_private_messages", default: 0
    t.integer "total_comment_likes", default: 0
    t.integer "total_insight_likes", default: 0
    t.integer "total_insight_views", default: 0
    t.integer "company_id"
    t.integer "insight_unique_views_by_client", default: 0
    t.integer "total_commissioned_insights", default: 0
    t.integer "total_rapid_response_insights", default: 0
    t.index ["account_id"], name: "index_account_engagement_reports_on_account_id"
    t.index ["company_id"], name: "index_account_engagement_reports_on_company_id"
  end

  create_table "account_originator_progress_reports", force: :cascade do |t|
    t.bigint "account_id"
    t.date "report_date"
    t.string "time_unit"
    t.integer "total_trial_clients_created"
    t.integer "total_trial_clients_converted"
    t.integer "total_professional_clients_created"
    t.integer "total_trial_insight_providers_created"
    t.integer "total_trial_insight_providers_converted"
    t.integer "total_external_insight_providers_created"
    t.jsonb "total_professional_clients_by_introducer_company"
    t.integer "total_trial_clients_revived"
    t.integer "total_professional_clients_revived"
    t.integer "total_trial_insight_providers_revived"
    t.integer "total_external_insight_providers_revived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_originator_progress_reports_on_account_id"
  end

  create_table "account_snapshots", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "country"
    t.boolean "activated"
    t.string "city"
    t.string "insight_provider_type"
    t.string "client_type"
    t.boolean "is_dormant"
    t.integer "account_lead_id"
    t.string "time_zone"
    t.datetime "trial_end_date"
    t.integer "trial_extensions_count"
    t.text "suspension_notes"
    t.integer "account_suspension_reason_id"
    t.string "funnel_status"
    t.integer "introducer_company_id"
    t.integer "introducer_id"
    t.boolean "is_compliance_officer"
    t.boolean "is_client"
    t.boolean "is_insight_provider"
    t.integer "account_id"
    t.integer "company_id"
    t.integer "user_id"
    t.integer "insight_provider_id"
    t.hstore "accreditations"
    t.string "jurisdiction"
    t.date "snapshot_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id"
    t.boolean "is_corporate_officer"
    t.boolean "is_individual_pass", default: false
    t.bigint "account_originator_id"
    t.index ["account_id", "snapshot_date"], name: "index_account_snapshots_on_account_id_and_snapshot_date", unique: true
    t.index ["account_id"], name: "index_account_snapshots_on_account_id"
    t.index ["account_originator_id"], name: "index_account_snapshots_on_account_originator_id"
    t.index ["account_suspension_reason_id"], name: "index_account_snapshots_on_account_suspension_reason_id"
    t.index ["company_id"], name: "index_account_snapshots_on_company_id"
    t.index ["insight_provider_id"], name: "index_account_snapshots_on_insight_provider_id"
    t.index ["introducer_company_id"], name: "index_account_snapshots_on_introducer_company_id"
    t.index ["introducer_id"], name: "index_account_snapshots_on_introducer_id"
    t.index ["is_corporate_officer"], name: "index_account_snapshots_on_is_corporate_officer"
    t.index ["is_individual_pass"], name: "index_account_snapshots_on_is_individual_pass"
    t.index ["plan_id"], name: "index_account_snapshots_on_plan_id"
    t.index ["user_id"], name: "index_account_snapshots_on_user_id"
  end

  create_table "account_suspension_reasons", id: :serial, force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_uploads", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.datetime "source_updated_at"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_uploads_on_account_id"
  end

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "authentication_token", default: "", null: false
    t.integer "company_id"
    t.string "city"
    t.string "country"
    t.string "slug"
    t.string "name"
    t.text "address"
    t.string "postalcode"
    t.string "mobile"
    t.boolean "activated", default: true
    t.string "headline"
    t.text "description"
    t.string "linked_in"
    t.string "twitter"
    t.string "website"
    t.string "education", default: [], array: true
    t.string "experience", default: [], array: true
    t.string "profile_photo_file_name"
    t.string "profile_photo_content_type"
    t.integer "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.tsvector "tsv"
    t.jsonb "communication_setting", default: {}
    t.integer "insight_provider_id"
    t.integer "user_id"
    t.jsonb "publication_setting", default: {}
    t.string "insight_provider_type"
    t.string "client_type"
    t.datetime "press_access_agreed_at"
    t.boolean "is_dormant", default: false
    t.integer "account_lead_id"
    t.string "first_name"
    t.string "gender"
    t.boolean "has_changed_password", default: false
    t.string "landline"
    t.jsonb "push_notification_setting", default: {}
    t.string "time_zone"
    t.jsonb "interface_setting", default: {}
    t.integer "team_size"
    t.datetime "trial_end_date"
    t.integer "trial_extensions_count", default: 0
    t.text "suspension_notes"
    t.integer "account_suspension_reason_id"
    t.datetime "notifications_read_at"
    t.string "funnel_status"
    t.integer "introducer_company_id"
    t.integer "introducer_id"
    t.integer "introducing_accounts_count", default: 0
    t.boolean "is_compliance_officer", default: false
    t.boolean "is_client", default: false
    t.boolean "is_insight_provider", default: false
    t.boolean "is_team_leader", default: false
    t.boolean "is_company_leader", default: false
    t.boolean "is_introducer", default: false
    t.uuid "rixml_person_id", default: -> { "public.gen_random_uuid()" }, null: false
    t.date "subscription_start_date"
    t.date "subscription_end_date"
    t.boolean "is_power_user", default: false
    t.boolean "is_introducer_only", default: false
    t.boolean "is_marketing_officer"
    t.boolean "is_operations_officer"
    t.bigint "team_id"
    t.bigint "account_originator_id"
    t.datetime "suspended_at"
    t.integer "min_market_cap"
    t.integer "max_market_cap"
    t.boolean "is_corporate_officer", default: false
    t.string "billing_reference"
    t.boolean "is_ib", default: false
    t.boolean "is_self_signup", default: false
    t.bigint "plan_id"
    t.datetime "revived_at"
    t.boolean "is_preview_pass", default: false
    t.integer "total_activities", default: 0
    t.datetime "last_active_at"
    t.integer "total_watched_entities", default: 0
    t.integer "total_followed_insight_providers", default: 0
    t.integer "total_alerts", default: 0
    t.datetime "insta_pass_first_active_at"
    t.bigint "related_company_id"
    t.string "preview_pass_interest"
    t.boolean "is_contactable", default: false
    t.string "linkedin_id"
    t.jsonb "preview_pass_related_company", default: {}
    t.integer "restrict_viewable_content_verticals", default: [], array: true
    t.boolean "is_individual_pass", default: false
    t.boolean "can_post_comments", default: false
    t.index ["account_originator_id"], name: "index_accounts_on_account_originator_id"
    t.index ["account_suspension_reason_id"], name: "index_accounts_on_account_suspension_reason_id"
    t.index ["company_id"], name: "index_accounts_on_company_id"
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["insight_provider_id"], name: "index_accounts_on_insight_provider_id"
    t.index ["introducer_company_id"], name: "index_accounts_on_introducer_company_id"
    t.index ["introducer_id"], name: "index_accounts_on_introducer_id"
    t.index ["is_client"], name: "index_accounts_on_is_client"
    t.index ["is_company_leader"], name: "index_accounts_on_is_company_leader"
    t.index ["is_compliance_officer"], name: "index_accounts_on_is_compliance_officer"
    t.index ["is_corporate_officer"], name: "index_accounts_on_is_corporate_officer"
    t.index ["is_individual_pass"], name: "index_accounts_on_is_individual_pass"
    t.index ["is_insight_provider"], name: "index_accounts_on_is_insight_provider"
    t.index ["is_introducer"], name: "index_accounts_on_is_introducer"
    t.index ["is_marketing_officer"], name: "index_accounts_on_is_marketing_officer"
    t.index ["is_operations_officer"], name: "index_accounts_on_is_operations_officer"
    t.index ["is_preview_pass"], name: "index_accounts_on_is_preview_pass"
    t.index ["plan_id"], name: "index_accounts_on_plan_id"
    t.index ["related_company_id"], name: "index_accounts_on_related_company_id"
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_accounts_on_slug", unique: true
    t.index ["team_id"], name: "index_accounts_on_team_id"
    t.index ["tsv"], name: "index_accounts_on_tsv", using: :gin
    t.index ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "accounts_access_passes", id: false, force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "access_pass_id"
    t.index ["access_pass_id"], name: "index_accounts_access_passes_on_access_pass_id"
    t.index ["account_id"], name: "index_accounts_access_passes_on_account_id"
  end

  create_table "accounts_foundry_roles", id: false, force: :cascade do |t|
    t.integer "account_id"
    t.integer "foundry_role_id"
    t.index ["account_id", "foundry_role_id"], name: "index_accounts_foundry_roles_on_account_id_and_foundry_role_id"
  end

  create_table "accounts_message_groups", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "message_group_id"
    t.boolean "joined", default: true
    t.boolean "is_read", default: true
    t.index ["account_id"], name: "index_accounts_message_groups_on_account_id"
    t.index ["message_group_id"], name: "index_accounts_message_groups_on_message_group_id"
  end

  create_table "accreditation_settings", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "investor_type", null: false
    t.string "jurisdiction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accreditation_settings_on_account_id"
  end

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace", limit: 255
    t.text "body"
    t.string "resource_id", limit: 255, null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "trackable_id"
    t.string "trackable_type", limit: 255
    t.integer "owner_id"
    t.string "owner_type", limit: 255
    t.string "key", limit: 255
    t.text "parameters"
    t.integer "recipient_id"
    t.string "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "anonymize", default: false
    t.string "origin", default: "smartkarma"
    t.string "channel", default: "web"
    t.inet "ip_address"
    t.string "location"
    t.string "city"
    t.string "country"
    t.jsonb "parameters_json"
    t.index ["created_at"], name: "idx_activities_created_at_desc", order: :desc
    t.index ["created_at"], name: "index_activities_on_created_at"
    t.index ["key"], name: "index_activities_on_key"
    t.index ["origin"], name: "index_activities_on_origin"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "activity_alert_settings", id: :serial, force: :cascade do |t|
    t.boolean "email_delivery", default: true
    t.boolean "notification_delivery", default: true
    t.boolean "enabled", default: true
    t.integer "activity_alert_id"
    t.integer "account_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_activity_alert_settings_on_account_id"
    t.index ["activity_alert_id"], name: "index_activity_alert_settings_on_activity_alert_id"
    t.index ["company_id"], name: "index_activity_alert_settings_on_company_id"
  end

  create_table "activity_alerts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "for_insight_provider"
    t.boolean "for_client"
    t.string "activity_keys", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "action_phrase"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "alerts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.jsonb "criteria"
    t.string "frequency"
    t.boolean "enabled", default: true
    t.boolean "email_delivery", default: true
    t.boolean "notification_delivery", default: true
    t.jsonb "delivery_setting"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "filter_preset_id"
    t.datetime "last_delivery_at"
    t.index ["account_id"], name: "index_alerts_on_account_id"
    t.index ["filter_preset_id"], name: "index_alerts_on_filter_preset_id"
  end

  create_table "alpha_captures", force: :cascade do |t|
    t.bigint "insight_id"
    t.bigint "entity_id"
    t.decimal "p0"
    t.string "currency"
    t.string "amount"
    t.decimal "target_price_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "p_today"
    t.datetime "p_last_updated"
    t.float "stop_loss_level"
    t.datetime "stop_loss_hit_date"
    t.datetime "target_px_hit_date"
    t.string "security"
    t.string "yahoo_ticker"
    t.string "capiq_ticker"
    t.string "side"
    t.string "horizon"
    t.datetime "close_date"
    t.string "conviction"
    t.string "ip_qva_rank"
    t.string "ip_performance_rank"
    t.float "performance_at_close"
    t.boolean "is_open"
    t.index ["entity_id"], name: "index_alpha_captures_on_entity_id"
    t.index ["insight_id", "entity_id"], name: "index_alpha_captures_on_insight_id_and_entity_id", unique: true
    t.index ["insight_id"], name: "index_alpha_captures_on_insight_id"
  end

  create_table "annotations", id: :serial, force: :cascade do |t|
    t.integer "annotator_id"
    t.string "annotator_type", limit: 255
    t.integer "annotable_id"
    t.string "annotable_type", limit: 255
    t.string "annotable_attribute", limit: 255
    t.integer "section_id"
    t.text "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "starred", default: false
    t.integer "parent_id"
    t.boolean "secret", default: false
    t.integer "mentioned_account_ids", default: [], array: true
    t.index ["annotable_id"], name: "index_annotations_on_annotable_id"
    t.index ["annotator_id"], name: "index_annotations_on_annotator_id"
    t.index ["parent_id"], name: "index_annotations_on_parent_id"
  end

  create_table "api_tokens", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.integer "rate_limit", default: 0
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_api_tokens_on_token", unique: true
  end

  create_table "asset_classes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "astotz_benchmarking_reports", id: :serial, force: :cascade do |t|
    t.string "sedol"
    t.string "bb_code"
    t.date "date_close"
    t.integer "year"
    t.float "roa"
    t.float "norm_epsg"
    t.float "asset_to"
    t.float "net_margin"
    t.float "sales_g"
    t.float "net_margin_b_pchg"
    t.float "country_roa"
    t.float "country_norm_epsg"
    t.float "country_asset_to"
    t.float "country_net_margin"
    t.float "country_sales_g"
    t.float "country_net_margin_b_pchg"
    t.float "global_roa"
    t.float "global_norm_epsg"
    t.float "global_asset_to"
    t.float "global_net_margin"
    t.float "global_sales_g"
    t.float "global_net_margin_b_pchg"
    t.integer "profitable_growth_sector_decile"
    t.integer "profitable_sector_decile"
    t.integer "growth_sector_decile"
    t.integer "asset_to_sector_decile"
    t.integer "net_margin_sector_decile"
    t.integer "sales_g_sector_decile"
    t.integer "net_margin_chg_sector_decile"
    t.integer "cos_in_global_sec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row_id"
    t.index ["bb_code"], name: "index_astotz_benchmarking_reports_on_bb_code"
    t.index ["row_id"], name: "index_astotz_benchmarking_reports_on_row_id"
    t.index ["sedol"], name: "index_astotz_benchmarking_reports_on_sedol"
  end

  create_table "attachments", id: :serial, force: :cascade do |t|
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.datetime "source_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "width", default: 0
    t.integer "height", default: 0
  end

  create_table "autoreply_email_settings", id: :serial, force: :cascade do |t|
    t.text "message"
    t.text "keys", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.text "signature"
  end

  create_table "billing_histories", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "account_id"
    t.bigint "plan_id"
    t.date "billing_date"
    t.string "quarter"
    t.integer "mbu"
    t.integer "mau_ids", array: true
    t.integer "total_users"
    t.decimal "billed_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mau"
    t.decimal "minimum_bill"
    t.integer "minimum_billed_users"
    t.decimal "price_per_active_user"
    t.decimal "saving"
    t.index ["account_id"], name: "index_billing_histories_on_account_id"
    t.index ["company_id"], name: "index_billing_histories_on_company_id"
    t.index ["plan_id"], name: "index_billing_histories_on_plan_id"
  end

  create_table "cancelled_insights", force: :cascade do |t|
    t.bigint "insight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insight_id"], name: "index_cancelled_insights_on_insight_id"
  end

  create_table "client_sales_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.string "period"
    t.hstore "total_clients_by_lead_distro"
    t.hstore "total_clients_by_introducer_company_distro"
    t.jsonb "total_clients_by_type_distro"
    t.string "time_unit"
    t.hstore "total_clients_by_funnel_status_distro"
  end

  create_table "client_segments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_items", force: :cascade do |t|
    t.bigint "collection_id"
    t.string "item_type"
    t.bigint "item_id"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ordering"
    t.index ["account_id"], name: "index_collection_items_on_account_id"
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
    t.index ["item_type", "item_id"], name: "index_collection_items_on_item_type_and_item_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.text "description"
    t.boolean "is_public", default: true
    t.jsonb "filters"
    t.string "item_types", array: true
    t.string "cover_image_file_name"
    t.string "cover_image_content_type"
    t.bigint "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state", default: "drafted"
    t.datetime "published_at"
    t.integer "featured_position"
    t.boolean "is_featured"
    t.string "default_sort"
    t.integer "insight_ids", array: true
    t.index ["account_id"], name: "index_collections_on_account_id"
  end

  create_table "comment_likes", id: :serial, force: :cascade do |t|
    t.integer "comment_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_comment_likes_on_account_id"
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
  end

  create_table "comment_tags", id: :serial, force: :cascade do |t|
    t.integer "comment_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_tags_on_comment_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comment_tags_on_commentable_type_and_commentable_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "commentable_id", default: 0
    t.string "commentable_type", limit: 255
    t.string "title", limit: 255
    t.text "body"
    t.string "subject", limit: 255
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "commenter_id"
    t.string "commenter_type", limit: 255
    t.boolean "anonymize", default: false
    t.boolean "internal", default: false
    t.integer "likes_count", default: 0
    t.integer "revisions_count", default: 0
    t.datetime "body_updated_at"
    t.integer "attachment_id"
    t.boolean "has_been_deleted", default: false
    t.integer "notified_account_ids", default: [], array: true
    t.index ["attachment_id"], name: "index_comments_on_attachment_id"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["commenter_id", "commenter_type"], name: "index_comments_on_commenter_id_and_commenter_type"
    t.index ["has_been_deleted"], name: "index_comments_on_has_been_deleted"
    t.index ["internal"], name: "index_comments_on_internal"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "address"
    t.string "city"
    t.string "postalcode"
    t.string "country"
    t.integer "accounts_count", default: 0, null: false
    t.integer "introducing_accounts_count", default: 0
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "tagline"
    t.text "summary"
    t.string "state"
    t.boolean "disable_viewing_comments", default: false
    t.boolean "disable_private_messages", default: false
    t.jsonb "areas_of_expertise", default: {}
    t.boolean "allow_ip_areas_of_expertise", default: true
    t.boolean "is_client", default: false
    t.boolean "is_insight_provider", default: false
    t.string "slug"
    t.boolean "publish_under_company_name", default: false
    t.integer "published_insights_count", default: 0
    t.boolean "disable_posting_comments", default: false
    t.integer "analysts_count", default: 0
    t.jsonb "publication_setting", default: {}
    t.text "custom_footer"
    t.integer "team_size"
    t.boolean "is_issuer_paid", default: false
    t.integer "published_external_reports_count", default: 0
    t.string "website"
    t.string "linked_in"
    t.string "twitter"
    t.string "facebook"
    t.integer "clients_count", default: 0
    t.boolean "offer_premium_services", default: true
    t.integer "premium_services_rate"
    t.boolean "premium_services_under_company", default: false
    t.boolean "enable_all_ips", default: true
    t.uuid "rixml_organization_id", default: -> { "public.gen_random_uuid()" }, null: false
    t.decimal "smarts", default: "0.0"
    t.boolean "enable_ps_requests", default: true
    t.datetime "smarts_expires_at"
    t.bigint "plan_id"
    t.integer "mbu"
    t.string "billing_frequency"
    t.date "subscription_start_date"
    t.integer "teams_count", default: 0
    t.integer "default_team_id"
    t.date "subscription_end_date"
    t.string "category"
    t.bigint "corporate_plan_id"
    t.date "corp_subscription_start_date"
    t.boolean "is_syndicator", default: false
    t.integer "available_message_credits", default: -1
    t.index ["corporate_plan_id"], name: "index_companies_on_corporate_plan_id"
    t.index ["default_team_id"], name: "index_companies_on_default_team_id"
    t.index ["plan_id"], name: "index_companies_on_plan_id"
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "companies_premium_services", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.integer "premium_service_id"
    t.index ["company_id"], name: "index_companies_premium_services_on_company_id"
    t.index ["premium_service_id"], name: "index_companies_premium_services_on_premium_service_id"
  end

  create_table "company_control_lists", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "enabled_company_id"
    t.bigint "disabled_company_id"
    t.bigint "enabled_account_id"
    t.bigint "disabled_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_control_lists_on_company_id"
    t.index ["disabled_account_id"], name: "index_company_control_lists_on_disabled_account_id"
    t.index ["disabled_company_id"], name: "index_company_control_lists_on_disabled_company_id"
    t.index ["enabled_account_id"], name: "index_company_control_lists_on_enabled_account_id"
    t.index ["enabled_company_id"], name: "index_company_control_lists_on_enabled_company_id"
  end

  create_table "company_payments", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "company_id"
    t.date "date"
    t.decimal "gross_total_amount", default: "0.0"
    t.decimal "cap_iq_amount", default: "0.0"
    t.decimal "bloomberg_amount", default: "0.0"
    t.decimal "net_amount", default: "0.0"
    t.decimal "one_off_amount", default: "0.0"
    t.decimal "net_final_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_company_payments_on_account_id"
    t.index ["company_id"], name: "index_company_payments_on_company_id"
  end

  create_table "company_stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compliance_feedbacks", id: :serial, force: :cascade do |t|
    t.text "message"
    t.integer "insight_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "anonymize", default: true
    t.integer "publication_id"
    t.string "publication_type"
    t.index ["account_id"], name: "index_compliance_feedbacks_on_account_id"
    t.index ["insight_id"], name: "index_compliance_feedbacks_on_insight_id"
    t.index ["publication_type", "publication_id"], name: "index_compliance_feedbacks_on_publication_type_and_id"
  end

  create_table "contact_list_items", force: :cascade do |t|
    t.boolean "has_been_deleted", default: false
    t.bigint "contact_list_id"
    t.bigint "entity_id"
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_list_id"], name: "index_contact_list_items_on_contact_list_id"
    t.index ["contactable_type", "contactable_id"], name: "index_contact_list_items_on_contactable_type_and_contactable_id"
    t.index ["entity_id"], name: "index_contact_list_items_on_entity_id"
  end

  create_table "contact_lists", force: :cascade do |t|
    t.string "name"
    t.boolean "has_been_deleted", default: false
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_contact_lists_on_entity_id"
  end

  create_table "contact_requests", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corp_email_campaigns_contact_lists", id: false, force: :cascade do |t|
    t.bigint "corporate_email_campaign_id"
    t.bigint "contact_list_id"
    t.index ["contact_list_id"], name: "idx_contact_list_id"
    t.index ["corporate_email_campaign_id"], name: "idx_corp_email_camp_id"
  end

  create_table "corporate_answers", force: :cascade do |t|
    t.text "body"
    t.bigint "account_id"
    t.bigint "attachment_id"
    t.bigint "corporate_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "body_updated_at"
    t.integer "likes_count", default: 0
    t.index ["account_id"], name: "index_corporate_answers_on_account_id"
    t.index ["attachment_id"], name: "index_corporate_answers_on_attachment_id"
    t.index ["corporate_question_id"], name: "index_corporate_answers_on_corporate_question_id"
  end

  create_table "corporate_attachments", force: :cascade do |t|
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.string "source_updated_at"
    t.integer "width", default: 0
    t.integer "height", default: 0
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.index ["attachable_type", "attachable_id"], name: "index_corp_attachments_on_attachable_type_and_id"
    t.index ["entity_id"], name: "index_corporate_attachments_on_entity_id"
  end

  create_table "corporate_email_campaigns", force: :cascade do |t|
    t.string "title"
    t.string "subject"
    t.text "content"
    t.string "status"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "scheduled_at"
    t.index ["entity_id"], name: "index_corporate_email_campaigns_on_entity_id"
  end

  create_table "corporate_events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text "detail"
    t.bigint "account_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.bigint "external_report_id"
    t.string "timezone", default: "Asia/Singapore"
    t.string "rsvp_url"
    t.string "source"
    t.string "source_url"
    t.bigint "insight_id"
    t.index ["account_id"], name: "index_corporate_events_on_account_id"
    t.index ["entity_id"], name: "index_corporate_events_on_entity_id"
    t.index ["external_report_id"], name: "index_corporate_events_on_external_report_id"
    t.index ["insight_id"], name: "index_corporate_events_on_insight_id"
  end

  create_table "corporate_likes", force: :cascade do |t|
    t.bigint "account_id"
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_corporate_likes_on_account_id"
    t.index ["likeable_type", "likeable_id"], name: "index_corporate_likes_on_likeable_type_and_likeable_id"
  end

  create_table "corporate_plans", force: :cascade do |t|
    t.string "name"
    t.jsonb "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corporate_presentations", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "corporate_event_id"
    t.string "aasm_state", default: "drafted"
    t.datetime "published_at"
    t.index ["corporate_event_id"], name: "index_corporate_presentations_on_corporate_event_id"
    t.index ["entity_id"], name: "index_corporate_presentations_on_entity_id"
  end

  create_table "corporate_questions", force: :cascade do |t|
    t.text "body"
    t.boolean "anonymize", default: false
    t.bigint "account_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attachment_id"
    t.datetime "body_updated_at"
    t.integer "likes_count", default: 0
    t.index ["account_id"], name: "index_corporate_questions_on_account_id"
    t.index ["attachment_id"], name: "index_corporate_questions_on_attachment_id"
    t.index ["entity_id"], name: "index_corporate_questions_on_entity_id"
  end

  create_table "corporate_unsubscribes", force: :cascade do |t|
    t.string "subscriber_type"
    t.bigint "subscriber_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_corporate_unsubscribes_on_entity_id"
    t.index ["subscriber_type", "subscriber_id"], name: "index_corporate_unsubscribes_on_subscriber"
  end

  create_table "counterparties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.float "share_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_geography_mandates", id: false, force: :cascade do |t|
    t.integer "country_mandate_id"
    t.integer "geography_mandate_id"
    t.index ["country_mandate_id"], name: "index_country_geography_mandates_on_country_mandate_id"
    t.index ["geography_mandate_id"], name: "index_country_geography_mandates_on_geography_mandate_id"
  end

  create_table "country_mandates", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "asean", default: false
    t.boolean "asia_ex_japan", default: false
    t.boolean "asia_pacific", default: false
    t.boolean "global", default: false
    t.boolean "global_emerging_markets", default: false
    t.boolean "developed_markets", default: false
    t.integer "insights_count", default: 0, null: false
    t.jsonb "insight_distribution"
    t.string "slug"
    t.jsonb "useful_links", default: []
    t.integer "entities_count", default: 0
    t.string "iso_alpha_2"
    t.index ["iso_alpha_2"], name: "index_country_mandates_on_iso_alpha_2"
    t.index ["slug"], name: "index_country_mandates_on_slug", unique: true
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by", limit: 255
    t.string "queue", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "distribution_restrictions", id: :serial, force: :cascade do |t|
    t.boolean "accreditation"
    t.text "jurisdictions", default: [], array: true
    t.integer "insight_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "disclaimer"
    t.integer "company_id"
    t.index ["company_id"], name: "index_distribution_restrictions_on_company_id"
    t.index ["insight_provider_id"], name: "index_distribution_restrictions_on_insight_provider_id"
    t.index ["jurisdictions"], name: "index_distribution_restrictions_on_jurisdictions", using: :gin
  end

  create_table "email_events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "sg_event_id"
    t.string "sg_message_id"
    t.datetime "sg_timestamp"
    t.jsonb "sg_params"
    t.integer "email_receipt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_receipt_id"], name: "index_email_events_on_email_receipt_id"
    t.index ["sg_message_id"], name: "index_email_events_on_sg_message_id"
  end

  create_table "email_prefaces", id: :serial, force: :cascade do |t|
    t.text "message"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_receipts", id: :serial, force: :cascade do |t|
    t.string "status"
    t.integer "recipient_id"
    t.string "recipient_type"
    t.integer "group_email_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sg_message_id"
    t.datetime "status_updated_at"
    t.string "reason"
    t.index ["group_email_message_id"], name: "index_email_receipts_on_group_email_message_id"
    t.index ["recipient_type", "recipient_id"], name: "index_email_receipts_on_recipient_type_and_recipient_id"
    t.index ["sg_message_id"], name: "index_email_receipts_on_sg_message_id"
  end

  create_table "engagement_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.integer "total_public_insight_views", default: 0
    t.integer "total_account_insight_views", default: 0
    t.hstore "activities_distro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_public_entity_views", default: 0
    t.integer "total_account_entity_views", default: 0
    t.integer "total_public_insight_provider_views", default: 0
    t.integer "total_account_insight_provider_views", default: 0
    t.integer "total_platform_activities", default: 0
    t.integer "total_public_content_vertical_views", default: 0
    t.integer "total_public_country_views", default: 0
    t.integer "total_public_sector_views", default: 0
    t.integer "total_public_company_views", default: 0
    t.integer "total_public_search", default: 0
  end

  create_table "entities", id: :serial, force: :cascade do |t|
    t.string "company_name", limit: 255
    t.string "short_name", limit: 255
    t.boolean "public"
    t.string "bloomberg_ticker", limit: 255
    t.string "google_finance_ticker", limit: 255
    t.string "factset_ticker", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "security", limit: 255
    t.string "bbgid", limit: 255
    t.string "country", limit: 255
    t.string "sector", limit: 255
    t.string "slug"
    t.tsvector "tsv"
    t.string "ciq_ticker"
    t.integer "market_cap"
    t.text "description"
    t.boolean "is_temporary_ticker", default: false
    t.string "exchange_code"
    t.integer "total_account_view", default: 0
    t.integer "total_public_view", default: 0
    t.integer "sector_mandate_id"
    t.string "isin"
    t.string "ric_ticker"
    t.string "yahoo_ticker"
    t.integer "industry_group_id"
    t.integer "industry_id"
    t.string "exchange_symbol"
    t.boolean "is_macro", default: false
    t.datetime "market_cap_updated_at"
    t.integer "exchange_code_mapping_id"
    t.string "market_status"
    t.string "pretty_name"
    t.string "unique_ticker"
    t.bigint "company_id"
    t.string "market_cap_type"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
    t.jsonb "contact_info"
    t.jsonb "investor_relation_info"
    t.string "country_of_primary_listing"
    t.string "stock_exchange"
    t.integer "total_employees"
    t.string "legal_form"
    t.bigint "primary_id"
    t.integer "aggregated_insights_count", default: 0
    t.boolean "is_claimed", default: false
    t.index ["bloomberg_ticker"], name: "index_entities_on_bloomberg_ticker", unique: true
    t.index ["company_id"], name: "index_entities_on_company_id"
    t.index ["exchange_code_mapping_id"], name: "index_entities_on_exchange_code_mapping_id"
    t.index ["industry_group_id"], name: "index_entities_on_industry_group_id"
    t.index ["industry_id"], name: "index_entities_on_industry_id"
    t.index ["primary_id"], name: "index_entities_on_primary_id"
    t.index ["sector_mandate_id"], name: "index_entities_on_sector_mandate_id"
    t.index ["slug"], name: "index_entities_on_slug", unique: true
    t.index ["tsv"], name: "index_entities_on_tsv", using: :gin
  end

  create_table "entities_external_reports", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.integer "external_report_id"
    t.index ["entity_id"], name: "index_entities_external_reports_on_entity_id"
    t.index ["external_report_id"], name: "index_entities_external_reports_on_external_report_id"
  end

  create_table "entities_insights", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.integer "insight_id"
    t.index ["entity_id"], name: "index_entities_insights_on_entity_id"
    t.index ["insight_id"], name: "index_entities_insights_on_insight_id"
  end

  create_table "entities_locker_items", id: false, force: :cascade do |t|
    t.integer "entity_id"
    t.integer "locker_item_id"
    t.index ["entity_id"], name: "index_entities_locker_items_on_entity_id"
    t.index ["locker_item_id"], name: "index_entities_locker_items_on_locker_item_id"
  end

  create_table "entity_analytic_reports", force: :cascade do |t|
    t.bigint "entity_id"
    t.date "report_date"
    t.string "frequency"
    t.integer "total_bearish", default: 0
    t.integer "total_bullish", default: 0
    t.integer "total_insight_providers", default: 0
    t.integer "total_insights", default: 0
    t.integer "total_watchers", default: 0
    t.integer "total_primary_insights", default: 0
    t.integer "total_views", default: 0
    t.integer "total_filings", default: 0
    t.integer "total_events", default: 0
    t.integer "total_discussions", default: 0
    t.integer "total_news", default: 0
    t.integer "total_contacts", default: 0
    t.integer "total_primary_insight_providers", default: 0
    t.integer "total_reports", default: 0
    t.integer "total_primary_reports", default: 0
    t.integer "total_report_providers", default: 0
    t.integer "total_primary_report_providers", default: 0
    t.integer "total_corporate_presentations", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_entity_analytic_reports_on_entity_id"
  end

  create_table "entity_analytics", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.integer "total_bearish", default: 0
    t.integer "total_bullish", default: 0
    t.integer "total_insight_providers", default: 0
    t.integer "total_insights", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "version_label", limit: 255
    t.integer "total_watchers", default: 0
    t.string "version_frequency"
    t.boolean "version_accumulative", default: false
    t.integer "total_primary_insights", default: 0
    t.integer "total_views", default: 0
    t.integer "total_filings", default: 0
    t.integer "total_events", default: 0
    t.integer "total_discussions", default: 0
    t.integer "total_news", default: 0
    t.integer "total_contacts", default: 0
    t.integer "total_primary_insight_providers", default: 0
    t.integer "total_reports", default: 0
    t.integer "total_primary_reports", default: 0
    t.integer "total_report_providers", default: 0
    t.integer "total_primary_report_providers", default: 0
    t.integer "total_corporate_presentations", default: 0
    t.index ["entity_id"], name: "index_entity_analytics_on_entity_id"
  end

  create_table "entity_discoveries", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.float "discovery_score", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_unique_clients_viewed", default: 0
    t.integer "total_insights_published", default: 0
    t.index ["entity_id"], name: "index_entity_discoveries_on_entity_id"
  end

  create_table "entity_extended_fields", force: :cascade do |t|
    t.float "price"
    t.string "currency"
    t.float "change"
    t.float "change_percentage"
    t.integer "volume"
    t.float "one_day_low"
    t.float "one_day_high"
    t.float "one_year_low"
    t.float "one_year_high"
    t.string "time"
    t.bigint "entity_id"
    t.bigint "entity_quote_source_id"
    t.jsonb "shortly_fields"
    t.jsonb "daily_fields"
    t.jsonb "monthly_fields"
    t.boolean "multiple_sources", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shortly_fields_updated_at"
    t.integer "daily_fields_updated_at"
    t.integer "monthly_fields_updated_at"
    t.index ["entity_id"], name: "index_entity_extended_fields_on_entity_id"
    t.index ["entity_quote_source_id"], name: "index_entity_extended_fields_on_entity_quote_source_id"
  end

  create_table "entity_management_profiles", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "profile_photo_file_name"
    t.string "profile_photo_content_type"
    t.bigint "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_entity_management_profiles_on_entity_id"
  end

  create_table "entity_mappings", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.jsonb "bloomberg_fields"
    t.jsonb "exchange_site_meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "bloomberg_fields_updated_at"
    t.index ["entity_id"], name: "index_entity_mappings_on_entity_id"
  end

  create_table "entity_news", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "url"
    t.datetime "release_time"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_entity_news_on_entity_id"
  end

  create_table "entity_owl_analytics", force: :cascade do |t|
    t.bigint "entity_id"
    t.string "isin"
    t.date "date"
    t.decimal "region_sector_count"
    t.decimal "esg"
    t.decimal "esg_regional_sector_rank"
    t.decimal "esg_regional_sector_percentile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_entity_owl_analytics_on_entity_id"
  end

  create_table "entity_quote_sources", id: :serial, force: :cascade do |t|
    t.string "source"
    t.string "source_url"
    t.json "attr_selectors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_reservations", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "corporate_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_event_reservations_on_account_id"
    t.index ["corporate_event_id"], name: "index_event_reservations_on_corporate_event_id"
  end

  create_table "exchange_announcement_categories", force: :cascade do |t|
    t.string "report_type"
    t.string "description"
    t.date "last_updated"
    t.string "sec_number"
    t.string "topic"
    t.bigint "exchange_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_exchange_announcement_categories_on_exchange_id"
  end

  create_table "exchange_announcements", id: :serial, force: :cascade do |t|
    t.datetime "release_time"
    t.string "security"
    t.string "stock_name"
    t.string "title"
    t.text "content"
    t.text "attachment", default: [], array: true
    t.integer "exchange_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id"
    t.jsonb "metadata"
    t.boolean "is_manually_created", default: false
    t.bigint "exchange_announcement_category_id"
    t.index ["entity_id"], name: "index_exchange_announcements_on_entity_id"
    t.index ["exchange_announcement_category_id"], name: "index_exchange_announcements_on_announcement_categories"
    t.index ["exchange_id"], name: "index_exchange_announcements_on_exchange_id"
  end

  create_table "exchange_code_mappings", id: :serial, force: :cascade do |t|
    t.string "market"
    t.string "sk_market_id"
    t.string "bloomberg_code"
    t.string "ciq_code"
    t.string "yahoo_code"
    t.string "google_finance_code"
    t.string "ric_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bloomberg_field"
  end

  create_table "exchange_commissions", id: :serial, force: :cascade do |t|
    t.string "exchange"
    t.float "rate", default: 0.0, null: false
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_exchange_commissions_on_company_id"
  end

  create_table "exchanges", id: :serial, force: :cascade do |t|
    t.string "exchange_type"
    t.text "domain"
    t.string "bbgid_suffix"
    t.text "search_url"
    t.text "announcement_url"
    t.text "date_input_prefix"
    t.text "next_input_prefix"
    t.text "next_input_selector"
    t.text "data_row_selector"
    t.json "exchange_attr_selectors"
    t.json "exchange_link_attr_selectors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "metadata"
  end

  create_table "external_entities", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.integer "stock_id"
    t.string "sedol"
    t.string "bb_code"
    t.string "isin"
    t.string "fact_set_code"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.string "perm_id"
    t.index ["entity_id"], name: "index_external_entities_on_entity_id"
    t.index ["isin"], name: "index_external_entities_on_isin"
    t.index ["perm_id"], name: "index_external_entities_on_perm_id"
  end

  create_table "external_events", force: :cascade do |t|
    t.bigint "corporate_event_id"
    t.string "sa_id"
    t.string "sa_tracking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporate_event_id"], name: "index_external_events_on_corporate_event_id"
    t.index ["sa_tracking_id"], name: "index_external_events_on_sa_tracking_id"
  end

  create_table "external_report_attachments", id: :serial, force: :cascade do |t|
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.datetime "source_updated_at"
    t.integer "external_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["external_report_id"], name: "index_external_report_attachments_on_external_report_id"
  end

  create_table "external_reports", id: :serial, force: :cascade do |t|
    t.string "tagline"
    t.text "executive_summary"
    t.text "metadata"
    t.integer "account_id"
    t.integer "primary_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.datetime "published_at"
    t.string "imperative"
    t.string "slug"
    t.string "format_type", default: "quick-note"
    t.integer "total_combined_read", default: 0
    t.integer "total_account_read", default: 0
    t.integer "total_public_read", default: 0
    t.integer "total_discussions", default: 0
    t.integer "guid"
    t.integer "company_id"
    t.boolean "no_sector", default: false
    t.text "cover_image_url"
    t.jsonb "gics", default: {}
    t.text "detail"
    t.string "time_horizon"
    t.text "source"
    t.text "source_url"
    t.tsvector "tsv"
    t.boolean "is_public", default: false
    t.float "conviction", default: 0.1
    t.index ["aasm_state"], name: "index_external_reports_on_aasm_state"
    t.index ["account_id"], name: "index_external_reports_on_account_id"
    t.index ["company_id"], name: "index_external_reports_on_company_id"
    t.index ["primary_entity_id"], name: "index_external_reports_on_primary_entity_id"
    t.index ["tsv"], name: "index_external_reports_on_tsv", using: :gin
  end

  create_table "external_reports_sk_content_verticals", primary_key: "false", id: :serial, force: :cascade do |t|
    t.integer "external_report_id"
    t.integer "sk_content_vertical_id"
    t.index ["external_report_id"], name: "index_external_reports_content_verticals_on_external_report_id"
    t.index ["sk_content_vertical_id"], name: "index_external_reports_content_verticals_on_content_vertical_id"
  end

  create_table "feature_participants", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "contact_number"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feature_usages", force: :cascade do |t|
    t.string "name"
    t.bigint "feature_participant_id"
    t.text "note"
    t.string "target_type"
    t.integer "target_id"
    t.inet "participant_ip"
    t.string "referrer_url"
    t.string "location"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_participant_id"], name: "index_feature_usages_on_feature_participant_id"
  end

  create_table "filter_presets", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.string "countries", default: [], array: true
    t.string "sectors", default: [], array: true
    t.string "strategies", default: [], array: true
    t.string "verticals", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_market_cap"
    t.integer "max_market_cap"
    t.string "format_types", array: true
    t.string "imperatives", array: true
    t.string "time_horizons", array: true
    t.index ["account_id"], name: "index_filter_presets_on_account_id"
  end

  create_table "follows", id: :serial, force: :cascade do |t|
    t.integer "followable_id", null: false
    t.string "followable_type", limit: 255, null: false
    t.integer "follower_id", null: false
    t.string "follower_type", limit: 255, null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "foundry_permissions", force: :cascade do |t|
    t.string "action"
    t.string "controller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action"], name: "index_foundry_permissions_on_action"
    t.index ["controller"], name: "index_foundry_permissions_on_controller"
  end

  create_table "foundry_report_snapshots", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.integer "total_accounts"
    t.jsonb "accounts_by_access_distro"
    t.jsonb "accounts_client_by_type_distro"
    t.jsonb "accounts_insight_provider_by_type_distro"
    t.jsonb "accounts_client_by_type_by_funnel_status_distro"
    t.jsonb "accounts_client_by_type_by_country_distro"
    t.jsonb "accounts_client_by_type_by_introducer_company_distro"
    t.jsonb "accounts_client_by_type_by_account_lead_distro"
    t.jsonb "accounts_insight_provider_dormant_by_type_distro"
    t.jsonb "accounts_insight_provider_by_type_by_account_lead_distro"
    t.integer "total_insights_published"
    t.jsonb "insights_by_content_vertical_distro"
    t.jsonb "insights_by_country_distro"
    t.jsonb "insights_by_sector_distro"
    t.jsonb "insights_by_imperative_distro"
    t.jsonb "insights_by_time_horizon_distro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "insights_by_market_cap_distro"
    t.jsonb "accounts_client_by_type_by_jurisdiction_distro"
    t.jsonb "suspended_clients_by_type_distro", default: {}
    t.jsonb "suspended_insight_providers_by_type_distro", default: {}
    t.integer "total_professional_client_companies", default: 0
    t.integer "total_insight_providers", default: 0
    t.integer "total_entities_covered", default: 0
    t.jsonb "professional_client_accounts_by_company_distro", default: {}
    t.jsonb "companies_without_professional_client_accounts", default: {}
    t.integer "total_accounts_with_elysium", default: 0
  end

  create_table "foundry_roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_foundry_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_foundry_roles_on_name"
  end

  create_table "foundry_roles_permissions", id: false, force: :cascade do |t|
    t.bigint "foundry_role_id"
    t.bigint "foundry_permission_id"
    t.index ["foundry_permission_id"], name: "index_foundry_roles_permissions_on_foundry_permission_id"
    t.index ["foundry_role_id"], name: "index_foundry_roles_permissions_on_foundry_role_id"
  end

  create_table "foundry_uploads", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.datetime "source_updated_at"
    t.integer "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_foundry_uploads_on_account_id"
    t.index ["attachable_type", "attachable_id"], name: "index_foundry_uploads_on_attachable_type_and_attachable_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", limit: 255, null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope", limit: 255
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "frontend_updates", id: :serial, force: :cascade do |t|
    t.string "version"
    t.string "commit_hash"
    t.string "update_type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geography_mandates", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "insights_count", default: 0, null: false
    t.string "slug"
    t.jsonb "useful_links", default: []
    t.index ["slug"], name: "index_geography_mandates_on_slug", unique: true
  end

  create_table "group_email_messages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.string "intro_message"
    t.text "content"
    t.datetime "scheduled_at"
    t.string "status", default: "draft"
    t.jsonb "account_group_filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "visitor_group_filter"
    t.integer "scheduler_id"
    t.string "sender"
    t.index ["scheduler_id"], name: "index_group_email_messages_on_scheduler_id"
  end

  create_table "growth_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.integer "total_group_emails_sent"
    t.jsonb "total_visitors_by_source"
    t.jsonb "total_visitors_by_referrer_url"
    t.jsonb "total_visitors_by_status"
    t.jsonb "total_visitors_by_interest"
    t.jsonb "total_trial_clients_by_funnel_status"
    t.jsonb "total_trial_clients_by_trial_duration"
    t.jsonb "total_clients_by_type"
    t.jsonb "total_professional_clients_by_introducer_company"
    t.integer "total_active_clients"
    t.jsonb "total_insight_providers_by_type"
    t.integer "total_active_insight_providers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_insight_providers_with_published_insight"
    t.jsonb "total_client_activities"
    t.jsonb "total_insight_provider_activities"
    t.string "time_unit"
    t.integer "total_active_accounts", default: 0
  end

  create_table "hubspot_contacts", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "company_id"
    t.integer "vid"
    t.jsonb "properties"
    t.bigint "lastmodifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_compliance_answers", default: false
    t.boolean "as_compliance_officer", default: false
    t.index ["account_id"], name: "index_hubspot_contacts_on_account_id"
    t.index ["as_compliance_officer"], name: "index_hubspot_contacts_on_as_compliance_officer"
    t.index ["company_id"], name: "index_hubspot_contacts_on_company_id"
    t.index ["has_compliance_answers"], name: "index_hubspot_contacts_on_has_compliance_answers"
    t.index ["vid"], name: "index_hubspot_contacts_on_vid"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "media_file_name", limit: 255
    t.string "media_content_type", limit: 255
    t.integer "media_file_size"
    t.datetime "media_updated_at"
    t.integer "attachable_id"
    t.string "attachable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "width", default: 0
    t.integer "height", default: 0
    t.index ["attachable_id", "attachable_type"], name: "index_images_on_attachable_id_and_attachable_type"
    t.index ["attachable_id"], name: "index_images_on_attachable_id"
  end

  create_table "industries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "industry_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industry_groups", id: :serial, force: :cascade do |t|
    t.integer "sector_mandate_id"
    t.string "name"
    t.string "[:sector_mandate]"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_mandate_id"], name: "index_industry_groups_on_sector_mandate_id"
  end

  create_table "insight_analytic_reports", force: :cascade do |t|
    t.date "report_date"
    t.bigint "account_id"
    t.bigint "company_id"
    t.bigint "insight_id"
    t.integer "total_account_read"
    t.integer "total_public_read"
    t.integer "total_client_read"
    t.integer "total_appreciates_by_clients"
    t.integer "total_appreciates_by_ips"
    t.integer "total_comments_by_clients"
    t.integer "total_comments_by_ips"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "performance", default: 0
    t.index ["account_id"], name: "index_insight_analytic_reports_on_account_id"
    t.index ["company_id"], name: "index_insight_analytic_reports_on_company_id"
    t.index ["insight_id"], name: "index_insight_analytic_reports_on_insight_id"
  end

  create_table "insight_classification_distributions", id: :serial, force: :cascade do |t|
    t.string "classification_type"
    t.integer "classification_id"
    t.string "version_label"
    t.string "version_frequency"
    t.integer "total_bearish", default: 0
    t.integer "total_bullish", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_type", "classification_id"], name: "index_insight_classification_on_classification_type_and_id"
  end

  create_table "insight_disclosure_settings", id: :serial, force: :cascade do |t|
    t.hstore "position_in_securities_options"
    t.text "certified_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insight_disclosures", id: :serial, force: :cascade do |t|
    t.integer "insight_id"
    t.integer "insight_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "position_in_securities", limit: 255
    t.boolean "certified"
    t.index ["insight_id"], name: "index_insight_disclosures_on_insight_id"
    t.index ["insight_provider_id"], name: "index_insight_disclosures_on_insight_provider_id"
  end

  create_table "insight_documents", id: :serial, force: :cascade do |t|
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.datetime "source_updated_at"
    t.integer "insight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.uuid "rixml_resource_id", default: -> { "public.gen_random_uuid()" }, null: false
    t.index ["insight_id"], name: "index_insight_documents_on_insight_id"
  end

  create_table "insight_drafts", force: :cascade do |t|
    t.bigint "insight_id"
    t.string "tagline"
    t.text "executive_summary"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "byline"
    t.index ["insight_id"], name: "index_insight_drafts_on_insight_id"
  end

  create_table "insight_likes", id: :serial, force: :cascade do |t|
    t.integer "insight_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0
    t.index ["account_id"], name: "index_insight_likes_on_account_id"
    t.index ["insight_id"], name: "index_insight_likes_on_insight_id"
  end

  create_table "insight_likes_like_reasons", id: :serial, force: :cascade do |t|
    t.integer "insight_like_id"
    t.integer "like_reason_id"
    t.index ["insight_like_id"], name: "index_insight_likes_like_reasons_on_insight_like_id"
    t.index ["like_reason_id"], name: "index_insight_likes_like_reasons_on_like_reason_id"
  end

  create_table "insight_mandate_supply_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.string "period"
    t.hstore "total_insights_by_country_distro"
    t.hstore "total_insights_by_sector_distro"
    t.hstore "total_insights_by_strategy_distro"
    t.string "time_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insight_provider_payments", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.date "date"
    t.decimal "gross_total_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.decimal "qva_amount", default: "0.0"
    t.decimal "premium_services_amount", default: "0.0"
    t.decimal "originals_amount", default: "0.0"
    t.decimal "rapid_responses_amount", default: "0.0"
    t.decimal "roadshows_amount", default: "0.0"
    t.decimal "referrals_amount", default: "0.0"
    t.index ["account_id"], name: "index_insight_provider_payments_on_account_id"
    t.index ["company_id"], name: "index_insight_provider_payments_on_company_id"
  end

  create_table "insight_provider_points", id: :serial, force: :cascade do |t|
    t.integer "insight_provider_id"
    t.integer "total_published_insights", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "total_insight_followers", default: 0
    t.integer "total_viewed_insights", default: 0
    t.integer "total_liked_reviews", default: 0
    t.integer "total_followers", default: 0
    t.integer "total_citations", default: 0
    t.integer "total_discussions", default: 0
    t.string "version_label", limit: 255
    t.integer "total_forks_of_my_insights_by_me", default: 0
    t.integer "total_forks_of_my_insights_by_others", default: 0
    t.integer "total_forks_of_others_by_me", default: 0
    t.integer "total_annotations_on_my_insights_by_me", default: 0
    t.integer "total_annotations_on_my_insights_by_others", default: 0
    t.integer "total_annotations_on_others_by_me", default: 0
    t.integer "total_comments_on_my_insights_by_me", default: 0
    t.integer "total_comments_on_my_insights_by_others", default: 0
    t.integer "total_comments_on_others_by_me", default: 0
    t.integer "total_inward_discussions", default: 0
    t.integer "total_outward_discussions", default: 0
    t.string "version_frequency"
    t.integer "total_combined_follows", default: 0
    t.integer "total_public_viewed_insights", default: 0
    t.integer "total_combined_viewed_insights", default: 0
    t.integer "total_liked_insights", default: 0
    t.integer "total_liked_comments", default: 0
    t.integer "total_private_messages", default: 0
    t.integer "total_published_external_reports", default: 0
    t.integer "total_viewed_external_reports", default: 0
    t.integer "total_public_viewed_external_reports", default: 0
    t.integer "total_combined_viewed_external_reports", default: 0
    t.integer "total_comments_on_entities", default: 0
    t.index ["insight_provider_id"], name: "index_insight_provider_points_on_insight_provider_id"
  end

  create_table "insight_provider_profiles", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insight_provider_supply_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.string "period"
    t.hstore "total_insight_providers_by_activity"
    t.hstore "total_insight_providers_by_type"
    t.jsonb "total_insight_providers_by_type_distro"
    t.hstore "total_insight_providers_by_lead"
    t.string "time_unit"
  end

  create_table "insight_providers", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore "communication_setting"
    t.string "pseudonym", limit: 255
    t.integer "unsubmitted_insights_count", default: 0, null: false
    t.integer "under_review_insights_count", default: 0, null: false
    t.integer "expiring_insights_count", default: 0, null: false
    t.text "custom_footer"
    t.integer "total_account_view", default: 0
    t.integer "total_public_view", default: 0
    t.datetime "last_published_at"
    t.boolean "activated", default: true
    t.jsonb "areas_of_expertise", default: {}
    t.datetime "first_published_at"
    t.boolean "offer_premium_services", default: false
    t.integer "premium_services_rate"
    t.boolean "coc_accepted", default: false
    t.index ["communication_setting"], name: "index_insight_providers_on_communication_setting", using: :gin
  end

  create_table "insight_providers_premium_services", id: false, force: :cascade do |t|
    t.integer "insight_provider_id"
    t.integer "premium_service_id"
    t.index ["insight_provider_id"], name: "index_insight_providers_premium_services_on_insight_provider_id"
    t.index ["premium_service_id"], name: "index_insight_providers_premium_services_on_premium_service_id"
  end

  create_table "insight_purchases", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "insight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "insight_id"], name: "index_insight_purchases_on_account_id_and_insight_id", unique: true
    t.index ["account_id"], name: "index_insight_purchases_on_account_id"
    t.index ["insight_id"], name: "index_insight_purchases_on_insight_id"
  end

  create_table "insight_streams", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "insight_id"
    t.integer "forked_from_insight_id"
    t.text "fork_ancestor_ids", default: [], array: true
    t.datetime "forked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["fork_ancestor_ids"], name: "index_insight_streams_on_fork_ancestor_ids", using: :gin
  end

  create_table "insight_supply_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.string "period"
    t.hstore "total_insights_by_time_horizon_distro"
    t.hstore "total_insights_by_imperative_distro"
    t.hstore "total_insights_by_content_vertical_distro"
    t.string "time_unit"
  end

  create_table "insights", id: :serial, force: :cascade do |t|
    t.string "tagline", limit: 255
    t.string "imperative", limit: 255
    t.text "executive_summary"
    t.text "detail"
    t.integer "original_insight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.string "time_horizon"
    t.integer "total_account_read", default: 0
    t.string "aasm_state", limit: 255
    t.hstore "context_data"
    t.integer "primary_entity_id"
    t.date "expiry_date"
    t.integer "annotations_count", default: 0, null: false
    t.datetime "aasm_state_updated_at"
    t.string "slug", limit: 255
    t.integer "comments_count", default: 0, null: false
    t.integer "total_public_read", default: 0, null: false
    t.integer "published_forked_count", default: 0, null: false
    t.string "format_type"
    t.integer "total_combined_read", default: 0
    t.integer "total_discussions", default: 0
    t.integer "mentioned_account_ids", default: [], array: true
    t.integer "main_insight_document_id"
    t.text "context_data_body"
    t.tsvector "tsv"
    t.integer "account_id"
    t.integer "likes_count", default: 0
    t.integer "dislikes_count", default: 0
    t.jsonb "gics", default: {}
    t.integer "company_id"
    t.boolean "show_author_names", default: true
    t.integer "mentioned_company_ids", default: [], array: true
    t.boolean "no_sector", default: false
    t.uuid "rixml_research_id", default: -> { "public.gen_random_uuid()" }, null: false
    t.uuid "rixml_product_id", default: -> { "public.gen_random_uuid()" }, null: false
    t.integer "total_actionable", default: 0
    t.integer "total_differentiated", default: 0
    t.integer "total_logical", default: 0
    t.integer "total_substantive", default: 0
    t.boolean "is_commissioned", default: false
    t.boolean "is_boost", default: false
    t.text "cover_image_url"
    t.integer "time_to_read"
    t.boolean "is_rapid_response", default: false
    t.boolean "is_exchange_sponsored", default: false
    t.text "byline"
    t.boolean "is_always_embargoed", default: false
    t.boolean "is_never_embargoed", default: false
    t.boolean "is_public", default: false
    t.float "conviction", default: 0.1
    t.boolean "is_noncommercial", default: false
    t.boolean "is_broker", default: false
    t.boolean "is_skpi", default: false
    t.index ["aasm_state"], name: "index_insights_on_aasm_state"
    t.index ["account_id"], name: "index_insights_on_account_id"
    t.index ["company_id"], name: "index_insights_on_company_id"
    t.index ["main_insight_document_id"], name: "index_insights_on_main_insight_document_id"
    t.index ["original_insight_id"], name: "index_insights_on_original_insight_id"
    t.index ["primary_entity_id"], name: "index_insights_on_primary_entity_id"
    t.index ["published_at"], name: "index_insights_on_published_at", order: "DESC NULLS LAST"
    t.index ["slug"], name: "index_insights_on_slug", unique: true
    t.index ["tsv"], name: "index_insights_on_tsv", using: :gin
  end

  create_table "insights_sk_content_verticals", primary_key: "false", id: :serial, force: :cascade do |t|
    t.integer "insight_id"
    t.integer "sk_content_vertical_id"
    t.index ["insight_id"], name: "index_insights_sk_content_verticals_on_insight_id"
    t.index ["sk_content_vertical_id"], name: "index_insights_sk_content_verticals_on_sk_content_vertical_id"
  end

  create_table "interest_lists", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_interest_lists_on_account_id"
  end

  create_table "introducer_progress_reports", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.date "report_date"
    t.string "time_unit"
    t.integer "total_trial_clients_created"
    t.integer "total_trial_clients_converted"
    t.integer "total_professional_clients_created"
    t.integer "total_trial_insight_providers_created"
    t.integer "total_trial_insight_providers_converted"
    t.integer "total_external_insight_providers_created"
    t.jsonb "total_professional_clients_by_introducer_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_trial_clients_revived", default: 0
    t.integer "total_professional_clients_revived", default: 0
    t.integer "total_trial_insight_providers_revived", default: 0
    t.integer "total_external_insight_providers_revived", default: 0
    t.index ["account_id"], name: "index_introducer_progress_reports_on_account_id"
  end

  create_table "investment_firm_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_transaction_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investor_companies", force: :cascade do |t|
    t.string "name"
    t.string "exchange_ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_reasons", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locker_items", id: :serial, force: :cascade do |t|
    t.string "access_level", default: "private", null: false
    t.string "title"
    t.integer "asset_id"
    t.string "asset_type"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.string "item_type"
    t.tsvector "tsv"
    t.string "reference"
    t.text "context_data"
    t.index ["account_id"], name: "index_locker_items_on_account_id"
    t.index ["asset_id"], name: "index_locker_items_on_asset_id"
    t.index ["tsv"], name: "index_locker_items_on_tsv", using: :gin
  end

  create_table "magic_tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_been_used", default: false
    t.boolean "send_email", default: true
    t.index ["account_id"], name: "index_magic_tokens_on_account_id"
    t.index ["token"], name: "index_magic_tokens_on_token", unique: true
  end

  create_table "message_groups", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "group_chat", default: false
    t.string "chat_room_name"
    t.bigint "entity_id"
    t.integer "messages_count", default: 0
    t.index ["entity_id"], name: "index_message_groups_on_entity_id"
  end

  create_table "message_receipts", id: :serial, force: :cascade do |t|
    t.integer "message_id"
    t.integer "owner_id"
    t.string "owner_type"
    t.boolean "is_read", default: false
    t.boolean "is_trashed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "receipt_type"
    t.boolean "notify", default: true
    t.integer "message_group_id"
    t.index ["message_group_id"], name: "index_message_receipts_on_message_group_id"
    t.index ["message_id"], name: "index_message_receipts_on_message_id"
    t.index ["owner_type", "owner_id"], name: "index_message_receipts_on_owner_type_and_owner_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.integer "message_group_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.string "sender_type"
    t.integer "attachment_id"
    t.index ["attachment_id"], name: "index_messages_on_attachment_id"
    t.index ["message_group_id"], name: "index_messages_on_message_group_id"
    t.index ["sender_id", "sender_type"], name: "index_messages_on_sender_id_and_sender_type"
  end

  create_table "metrics", id: :serial, force: :cascade do |t|
    t.integer "total_published_insights"
    t.float "average_published_insights"
    t.integer "total_combined_read_insights"
    t.float "average_combined_read_insights"
    t.integer "total_insight_discussions"
    t.float "average_insight_discussions"
    t.integer "total_combined_follows"
    t.float "average_combined_follows"
    t.integer "total_under_review_insights"
    t.integer "total_insight_providers"
    t.integer "total_active_insight_providers"
    t.string "version_label"
    t.string "version_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_covered_entities", default: 0
    t.boolean "version_accumulative", default: false
    t.integer "total_public_view_insights"
    t.float "average_public_view_insights"
    t.integer "total_citations"
    t.float "average_citations"
    t.integer "total_insight_likes"
    t.float "average_insight_likes"
    t.integer "total_private_messages"
    t.float "average_private_messages"
  end

  create_table "mtd_account_engagement_reports", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "company_id"
    t.date "report_date"
    t.integer "comment_likes_by_client", default: 0
    t.integer "comment_likes_by_ip", default: 0
    t.integer "outgoing_discussions", default: 0
    t.integer "incoming_discussions_from_client", default: 0
    t.integer "incoming_discussions_from_ip", default: 0
    t.integer "incoming_pm_from_client", default: 0
    t.integer "incoming_pm_from_ip", default: 0
    t.integer "insight_likes_by_client", default: 0
    t.integer "insight_likes_by_ip", default: 0
    t.integer "total_followers", default: 0
    t.integer "total_citations", default: 0
    t.integer "total_published_insights", default: 0
    t.integer "total_public_insight_views", default: 0
    t.integer "insight_views_by_client", default: 0
    t.integer "insight_views_by_ip", default: 0
    t.integer "total_discussions", default: 0
    t.integer "total_private_messages", default: 0
    t.integer "total_comment_likes", default: 0
    t.integer "total_insight_likes", default: 0
    t.integer "total_insight_views", default: 0
    t.integer "insight_unique_views_by_client", default: 0
    t.integer "total_commissioned_insights", default: 0
    t.integer "total_rapid_response_insights", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_mtd_account_engagement_reports_on_account_id"
    t.index ["company_id"], name: "index_mtd_account_engagement_reports_on_company_id"
  end

  create_table "mtd_qva_reports", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "company_id"
    t.date "report_date"
    t.integer "total_published_insights", default: 0
    t.float "qva", default: 0.0
    t.float "total_qva"
    t.float "qva_share"
    t.float "qva_company_share", default: 0.0
    t.string "ip_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "qva_share_change"
    t.float "qva_relative_change"
    t.index ["account_id"], name: "index_mtd_qva_reports_on_account_id"
    t.index ["company_id"], name: "index_mtd_qva_reports_on_company_id"
  end

  create_table "muted_items", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "muted_account_id"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_muted_items_on_account_id"
    t.index ["muted_account_id"], name: "index_muted_items_on_muted_account_id"
  end

  create_table "notification_actors", id: :serial, force: :cascade do |t|
    t.integer "notification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "activity_id"
    t.integer "actor_id"
    t.string "actor_type"
    t.string "remark_type"
    t.bigint "remark_id"
    t.index ["activity_id"], name: "index_notification_actors_on_activity_id"
    t.index ["actor_type", "actor_id"], name: "index_notification_actors_on_actor_type_and_actor_id"
    t.index ["notification_id"], name: "index_notification_actors_on_notification_id"
    t.index ["remark_type", "remark_id"], name: "index_notification_actors_on_remark_type_and_remark_id"
  end

  create_table "notification_rules", force: :cascade do |t|
    t.string "actor_condition"
    t.string "recipient_condition"
    t.boolean "is_allowed", default: false
    t.bigint "notification_verb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_verb_id"], name: "index_notification_rules_on_notification_verb_id"
  end

  create_table "notification_verbs", force: :cascade do |t|
    t.string "key"
    t.string "verb"
    t.string "linkable"
    t.index ["key"], name: "index_notification_verbs_on_key", unique: true
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "trackable_id"
    t.string "trackable_type"
    t.string "key"
    t.jsonb "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "groupable", default: false
    t.string "verb"
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.index ["account_id"], name: "index_notifications_on_account_id"
    t.index ["linkable_type", "linkable_id"], name: "index_notifications_on_linkable_type_and_linkable_id"
    t.index ["trackable_type", "trackable_id"], name: "index_notifications_on_trackable_type_and_trackable_id"
    t.index ["updated_at"], name: "index_notifications_on_updated_at", order: :desc
  end

  create_table "page_screenshots", force: :cascade do |t|
    t.string "url_path"
    t.integer "width"
    t.string "api_image_url"
    t.string "page_model_type"
    t.bigint "page_model_id"
    t.datetime "taken_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_model_type", "page_model_id"], name: "index_page_screenshots_on_page_model_type_and_page_model_id"
  end

  create_table "peer_entities", force: :cascade do |t|
    t.integer "entity_id", null: false
    t.integer "peer_entity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_peer_entities_on_entity_id"
    t.index ["peer_entity_id"], name: "index_peer_entities_on_peer_entity_id"
  end

  create_table "personal_email_domains", id: :serial, force: :cascade do |t|
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personalized_insights", id: false, force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "insight_id"
    t.decimal "score"
    t.index ["account_id", "insight_id"], name: "index_personalized_insights_on_account_id_and_insight_id", unique: true
    t.index ["account_id"], name: "index_personalized_insights_on_account_id"
    t.index ["insight_id"], name: "index_personalized_insights_on_insight_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platform_email_messages", id: :serial, force: :cascade do |t|
    t.string "mailer_template"
    t.jsonb "mailer_args", default: []
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_template", default: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.bigint "email_receipt_id"
    t.bigint "corporate_email_campaign_id"
    t.index ["corporate_email_campaign_id"], name: "index_platform_email_messages_on_corporate_email_campaign_id"
    t.index ["email_receipt_id"], name: "index_platform_email_messages_on_email_receipt_id"
    t.index ["owner_type", "owner_id"], name: "index_platform_email_messages_on_owner_type_and_owner_id"
  end

  create_table "platform_permissions", force: :cascade do |t|
    t.string "action"
    t.string "controller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action"], name: "index_platform_permissions_on_action"
    t.index ["controller"], name: "index_platform_permissions_on_controller"
  end

  create_table "premium_service_attachments", force: :cascade do |t|
    t.string "source_file_name"
    t.string "source_content_type"
    t.integer "source_file_size"
    t.datetime "source_updated_at"
    t.bigint "premium_service_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_premium_service_attachments_on_account_id"
    t.index ["premium_service_request_id"], name: "index_premium_service_attachments_on_premium_service_request_id"
  end

  create_table "premium_service_note_receipts", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "premium_service_note_id"
    t.bigint "premium_service_request_id"
    t.boolean "is_read", default: false
    t.boolean "notify", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_premium_service_note_receipts_on_account_id"
    t.index ["premium_service_note_id"], name: "index_premium_service_note_receipts_on_premium_service_note_id"
    t.index ["premium_service_request_id"], name: "index_ps_note_receipts_on_ps_request_id"
  end

  create_table "premium_service_notes", force: :cascade do |t|
    t.bigint "premium_service_request_id"
    t.bigint "account_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_premium_service_notes_on_account_id"
    t.index ["premium_service_request_id"], name: "index_premium_service_notes_on_premium_service_request_id"
  end

  create_table "premium_service_packages", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.decimal "exchange_rate"
    t.decimal "total_smarts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duration"
    t.boolean "is_complimentary", default: false
  end

  create_table "premium_service_rates", force: :cascade do |t|
    t.string "name"
    t.decimal "max_ip_rate"
    t.decimal "margin"
    t.decimal "charged_rate"
    t.decimal "percentile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "smarts"
  end

  create_table "premium_service_requests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "requestor_id"
    t.bigint "requestee_id"
    t.bigint "premium_service_id"
    t.integer "time_required"
    t.decimal "smarts_required"
    t.string "status"
    t.datetime "status_updated_at"
    t.datetime "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "scheduled_at"
    t.tsvector "tsv"
    t.bigint "manager_id"
    t.float "rating"
    t.text "feedback"
    t.datetime "submitted_at"
    t.datetime "cancelled_at"
    t.datetime "delivered_at"
    t.decimal "interactions", default: "1.0"
    t.decimal "smarts_per_interaction"
    t.decimal "amount"
    t.index ["manager_id"], name: "index_premium_service_requests_on_manager_id"
    t.index ["premium_service_id"], name: "index_premium_service_requests_on_premium_service_id"
    t.index ["requestee_id"], name: "index_premium_service_requests_on_requestee_id"
    t.index ["requestor_id"], name: "index_premium_service_requests_on_requestor_id"
    t.index ["tsv"], name: "index_premium_service_requests_on_tsv", using: :gin
  end

  create_table "premium_service_transactions", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "premium_service_request_id"
    t.string "transaction_type"
    t.decimal "smarts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.bigint "premium_service_package_id"
    t.datetime "expires_at"
    t.index ["company_id"], name: "index_premium_service_transactions_on_company_id"
    t.index ["premium_service_package_id"], name: "index_ps_transactions_on_ps_package_id"
    t.index ["premium_service_request_id"], name: "index_ps_requests_on_ps_transactions"
  end

  create_table "premium_services", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "push_notification_messages", id: :serial, force: :cascade do |t|
    t.integer "push_notification_token_id"
    t.string "title"
    t.string "message"
    t.string "icon"
    t.string "action_url"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.boolean "is_sent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag"
    t.index ["created_at"], name: "index_push_notification_messages_on_created_at"
    t.index ["is_sent"], name: "index_push_notification_messages_on_is_sent"
    t.index ["push_notification_token_id"], name: "index_push_notification_messages_on_push_notification_token_id"
  end

  create_table "push_notification_tokens", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "token"
    t.string "browser"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "user_agent"
    t.datetime "last_sent_at"
    t.string "platform"
    t.string "mobile_os"
    t.index ["token"], name: "index_push_notification_tokens_on_token"
  end

  create_table "qva_metrics", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "metric_type"
    t.float "power"
    t.float "multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qva_reports", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.date "report_date"
    t.integer "total_published_insights", default: 0
    t.boolean "paid", default: false
    t.boolean "ranked", default: false
    t.float "collaboration_points", default: 0.0
    t.float "engagement_points", default: 0.0
    t.float "qva", default: 0.0
    t.float "total_qva"
    t.float "qva_share"
    t.float "qva_rolling", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip_rank"
    t.integer "company_id"
    t.float "qva_relative_share", default: 0.0
    t.float "qva_share_change"
    t.float "qva_relative_change"
    t.index ["company_id"], name: "index_qva_reports_on_company_id"
  end

  create_table "read_publications", force: :cascade do |t|
    t.bigint "account_id"
    t.string "publication_type"
    t.bigint "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_read_publications_on_account_id"
    t.index ["publication_type", "publication_id"], name: "index_read_publications_on_publication_type_and_publication_id"
  end

  create_table "reading_lists", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "insight_ids", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_reading_lists_on_account_id"
  end

  create_table "sales_activity_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.integer "total_professional_clients_created", default: 0
    t.integer "total_trial_clients_converted_to_professional", default: 0
    t.integer "total_revived_professional_clients", default: 0
    t.integer "total_suspended_professional_clients", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_progress_reports", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.date "report_date"
    t.string "time_unit"
    t.integer "total_client_prospects_created"
    t.integer "total_trial_clients_created"
    t.integer "total_trial_clients_converted"
    t.integer "total_professional_clients_created"
    t.integer "total_insight_providers_prospects_created"
    t.integer "total_trial_insight_providers_created"
    t.integer "total_trial_insight_providers_converted"
    t.integer "total_external_insight_providers_created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "total_professional_clients_by_introducer_company", default: {}
    t.integer "total_trial_clients_revived", default: 0
    t.integer "total_professional_clients_revived", default: 0
    t.integer "total_trial_insight_providers_revived", default: 0
    t.integer "total_external_insight_providers_revived", default: 0
    t.index ["account_id"], name: "index_sales_progress_reports_on_account_id"
  end

  create_table "sales_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.integer "total_visitors", default: 0
    t.integer "total_trial_clients_created", default: 0
    t.integer "total_trial_clients_converted", default: 0
    t.hstore "visitor_country_distro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_professional_clients_created", default: 0
    t.hstore "trial_clients_created_distro"
    t.hstore "trial_clients_converted_distro"
    t.hstore "professional_clients_created_distro"
    t.integer "total_clients", default: 0
    t.hstore "total_clients_by_type"
    t.jsonb "total_clients_by_type_distro"
    t.hstore "total_clients_by_lead_distro"
    t.hstore "total_clients_by_introducer_company_distro"
    t.hstore "total_clients_by_funnel_status_distro"
    t.hstore "total_visitors_by_interest_distro"
    t.hstore "total_visitors_by_source_distro"
    t.hstore "trial_clients_by_lead_distro"
    t.hstore "trial_clients_by_introducer_company_distro"
    t.index ["total_clients_by_type_distro"], name: "index_sales_reports_on_total_clients_by_type_distro", using: :gin
  end

  create_table "search_histories", id: :serial, force: :cascade do |t|
    t.string "query"
    t.integer "searchable_id"
    t.string "searchable_type"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_counts"
    t.integer "position"
    t.index ["account_id"], name: "index_search_histories_on_account_id"
    t.index ["searchable_type", "searchable_id"], name: "index_search_histories_on_searchable_type_and_searchable_id"
  end

  create_table "searchjoy_searches", force: :cascade do |t|
    t.bigint "account_id"
    t.string "search_type"
    t.string "query"
    t.string "normalized_query"
    t.integer "results_count"
    t.datetime "created_at"
    t.string "convertable_type"
    t.bigint "convertable_id"
    t.datetime "converted_at"
    t.index ["account_id"], name: "index_searchjoy_searches_on_account_id"
    t.index ["convertable_type", "convertable_id"], name: "index_searchjoy_searches_on_convertable"
    t.index ["created_at"], name: "index_searchjoy_searches_on_created_at"
    t.index ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at"
    t.index ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_query"
  end

  create_table "sector_mandates", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "insights_count", default: 0, null: false
    t.jsonb "insight_distribution"
    t.string "slug"
    t.jsonb "useful_links", default: []
    t.integer "entities_count", default: 0
    t.string "gics_code"
    t.index ["slug"], name: "index_sector_mandates_on_slug", unique: true
  end

  create_table "sendgrid_templates", force: :cascade do |t|
    t.string "mailer_template"
    t.string "template_id"
    t.string "environment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment", "mailer_template"], name: "index_sendgrid_templates_on_environment_and_mailer_template", unique: true
  end

  create_table "shared_items", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "shareable_id"
    t.string "shareable_type"
    t.string "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sharer_id"
    t.index ["account_id"], name: "index_shared_items_on_account_id"
    t.index ["shareable_type", "shareable_id"], name: "index_shared_items_on_shareable_type_and_shareable_id"
    t.index ["sharer_id"], name: "index_shared_items_on_sharer_id"
  end

  create_table "shortened_links", force: :cascade do |t|
    t.string "url"
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "shortened", default: false
    t.string "long_url"
    t.string "name"
    t.string "category"
    t.index ["linkable_type", "linkable_id"], name: "index_shortened_links_on_linkable_type_and_linkable_id"
  end

  create_table "sk_content_verticals", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "description", limit: 255
    t.string "fieldset_names", limit: 255, default: ""
    t.string "screen_names", limit: 255, default: ""
    t.boolean "auto_tag_entities", default: false
    t.boolean "respect_market_cap", default: true
    t.integer "strategy_mandate_id"
    t.string "security_type"
    t.string "hash_tags"
    t.jsonb "insight_distribution"
    t.string "slug"
    t.jsonb "useful_links", default: []
    t.integer "insights_count", default: 0
    t.index ["parent_id"], name: "index_sk_content_verticals_on_parent_id"
    t.index ["slug"], name: "index_sk_content_verticals_on_slug", unique: true
    t.index ["strategy_mandate_id"], name: "index_sk_content_verticals_on_strategy_mandate_id"
  end

  create_table "sk_sitemaps", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_sk_sitemaps_on_url", unique: true
  end

  create_table "strategy_mandates", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "insights_count", default: 0, null: false
    t.string "slug"
    t.jsonb "useful_links", default: []
    t.index ["slug"], name: "index_strategy_mandates_on_slug", unique: true
  end

  create_table "stripe_settings", force: :cascade do |t|
    t.string "environment"
    t.string "name"
    t.string "stripe_description"
    t.string "stripe_plan_id"
    t.float "price"
    t.string "price_currency", default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supply_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.integer "total_insight_providers"
    t.integer "total_insights_published"
    t.float "average_productivity"
    t.hstore "total_insights_by_time_horizon_distro"
    t.hstore "total_insights_by_imperative_distro"
    t.hstore "total_insights_by_content_vertical_distro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_insight_providers_created", default: 0
    t.hstore "total_insight_providers_by_activity"
    t.hstore "total_insight_providers_by_type"
    t.jsonb "total_insight_providers_by_type_distro"
    t.hstore "total_insight_providers_by_lead"
    t.hstore "total_insights_by_country_distro"
    t.hstore "total_insights_by_sector_distro"
    t.hstore "total_insights_by_strategy_distro"
    t.integer "total_internal_external_ips", default: 0
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type", limit: 255
    t.integer "tagger_id"
    t.string "tagger_type", limit: 255
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "target_investors", force: :cascade do |t|
    t.string "name"
    t.string "headline"
    t.string "email"
    t.string "board_info"
    t.string "contact_number"
    t.string "mobile"
    t.string "address"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "investor_company_id"
    t.bigint "investment_firm_type_id"
    t.string "investment_firm_type"
    t.float "equity_investment_min"
    t.float "equity_investment_max"
    t.float "total_revenues_min"
    t.float "total_revenues_max"
    t.float "ebitda_min"
    t.float "ebitda_max"
    t.float "enterprise_value_min"
    t.float "enterprise_value_max"
    t.float "assets_under_management"
    t.string "first_name"
    t.string "last_name"
    t.bigint "entity_id"
    t.boolean "is_email_dropped", default: false
    t.tsvector "tsv"
    t.string "description"
    t.index ["entity_id"], name: "index_target_investors_on_entity_id"
    t.index ["investment_firm_type_id"], name: "index_target_investors_on_investment_firm_type_id"
    t.index ["investor_company_id"], name: "index_target_investors_on_investor_company_id"
    t.index ["tsv"], name: "index_target_investors_on_tsv", using: :gin
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "assignee_id"
    t.integer "assigner_id"
    t.string "title"
    t.text "description"
    t.string "status"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due_date"
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["assigner_id"], name: "index_tasks_on_assigner_id"
    t.index ["status"], name: "index_tasks_on_status"
    t.index ["taggable_id", "taggable_type"], name: "index_tasks_on_taggable_id_and_taggable_type"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accounts_count", default: 0
    t.index ["company_id"], name: "index_teams_on_company_id"
  end

  create_table "teamwide_pricings", force: :cascade do |t|
    t.integer "mau"
    t.decimal "total_teamwide_bill"
    t.decimal "price_per_user"
    t.decimal "pricer_per_incremental_user"
    t.decimal "per_user_discount"
    t.decimal "per_incremental_user_discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["uid"], name: "index_tools_on_uid", unique: true
  end

  create_table "trading_reports", id: :serial, force: :cascade do |t|
    t.integer "total_quantity", default: 0
    t.float "total_notional_amount", default: 0.0
    t.float "total_gross_revenue", default: 0.0
    t.float "total_skx_revenue", default: 0.0
    t.float "total_counterparty_revenue", default: 0.0
    t.string "version_label"
    t.string "version_frequency"
    t.integer "company_id"
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "entity_id"], name: "index_trading_reports_on_company_id_and_entity_id", unique: true
    t.index ["company_id"], name: "index_trading_reports_on_company_id"
    t.index ["entity_id"], name: "index_trading_reports_on_entity_id"
  end

  create_table "trading_transactions", id: :serial, force: :cascade do |t|
    t.date "trade_date"
    t.string "trade_type"
    t.integer "quantity"
    t.float "gross_price"
    t.float "commission_rate"
    t.float "fx_rate"
    t.float "notional_amount"
    t.float "gross_revenue"
    t.float "skx_revenue"
    t.float "counterparty_revenue"
    t.integer "company_id"
    t.integer "counterparty_id"
    t.integer "exchange_commission_id"
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "use_custom_rate", default: false, null: false
    t.text "remarks"
    t.boolean "inverse_fx_rate", default: false
    t.index ["company_id", "entity_id"], name: "index_trading_transactions_on_company_id_and_entity_id"
    t.index ["company_id"], name: "index_trading_transactions_on_company_id"
    t.index ["counterparty_id"], name: "index_trading_transactions_on_counterparty_id"
    t.index ["entity_id"], name: "index_trading_transactions_on_entity_id"
    t.index ["exchange_commission_id"], name: "index_trading_transactions_on_exchange_commission_id"
  end

  create_table "trending_insight_providers", id: :serial, force: :cascade do |t|
    t.text "account_ids", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trending_insights", id: false, force: :cascade do |t|
    t.bigint "insight_id"
    t.decimal "score"
    t.index ["insight_id"], name: "index_trending_insights_on_insight_id", unique: true
  end

  create_table "trial_client_sales_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.string "period"
    t.hstore "trial_clients_by_lead_distro"
    t.hstore "trial_clients_by_introducer_company_distro"
    t.string "time_unit"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore "accreditations"
    t.string "jurisdiction"
    t.boolean "activated", default: true
    t.string "persona"
    t.string "client_segment"
    t.string "investment_style"
    t.index ["accreditations"], name: "index_users_on_accreditations", using: :gin
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", limit: 255, null: false
    t.integer "item_id", null: false
    t.string "event", limit: 255, null: false
    t.string "whodunnit", limit: 255
    t.text "object"
    t.datetime "created_at"
    t.string "label", limit: 255
    t.string "frequency"
    t.boolean "accumulative", default: false
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "vertical_providers", id: :serial, force: :cascade do |t|
    t.integer "insight_provider_id"
    t.integer "sk_content_vertical_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "total_insights", default: 0
    t.index ["insight_provider_id"], name: "index_vertical_providers_on_insight_provider_id"
    t.index ["sk_content_vertical_id"], name: "index_vertical_providers_on_sk_content_vertical_id"
  end

  create_table "vertical_subscriptions", id: :serial, force: :cascade do |t|
    t.integer "sk_content_vertical_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_vertical_subscriptions_on_account_id"
    t.index ["sk_content_vertical_id"], name: "index_vertical_subscriptions_on_sk_content_vertical_id"
  end

  create_table "visitor_sales_reports", id: :serial, force: :cascade do |t|
    t.date "report_date"
    t.string "period"
    t.hstore "visitor_country_distro"
    t.hstore "total_visitors_by_interest_distro"
    t.hstore "total_visitors_by_source_distro"
    t.string "time_unit"
  end

  create_table "visitors", id: :serial, force: :cascade do |t|
    t.string "fullname", limit: 255
    t.string "email", limit: 255
    t.string "contact_number", limit: 255
    t.string "interest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "message"
    t.string "note"
    t.inet "sign_up_ip"
    t.string "location"
    t.string "status"
    t.integer "account_id"
    t.string "country"
    t.string "company_name"
    t.string "referrer_url"
    t.boolean "newsletter_subscription", default: false
    t.string "landline"
    t.string "mobile"
    t.string "address"
    t.string "city"
    t.string "source"
    t.integer "account_lead_id"
    t.integer "company_id"
    t.datetime "last_visited_at"
    t.index ["account_id"], name: "index_visitors_on_account_id"
    t.index ["company_id"], name: "index_visitors_on_company_id"
  end

  create_table "watched_items", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "watchable_id"
    t.string "watchable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "watchlist_id"
    t.index ["account_id"], name: "index_watched_items_on_account_id"
    t.index ["watchable_type", "watchable_id"], name: "index_watched_items_on_watchable_type_and_watchable_id"
    t.index ["watchlist_id"], name: "index_watched_items_on_watchlist_id"
  end

  create_table "watchlists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sort_by"
    t.string "sorted_tickers"
    t.index ["account_id"], name: "index_watchlists_on_account_id"
  end

  create_table "web_properties", id: :serial, force: :cascade do |t|
    t.string "link"
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "companies"
  add_foreign_key "accreditation_settings", "accounts"
  add_foreign_key "alerts", "accounts"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collections", "accounts"
  add_foreign_key "company_payments", "accounts"
  add_foreign_key "company_payments", "companies"
  add_foreign_key "compliance_feedbacks", "accounts"
  add_foreign_key "contact_list_items", "contact_lists"
  add_foreign_key "contact_list_items", "entities"
  add_foreign_key "contact_lists", "entities"
  add_foreign_key "corporate_answers", "accounts"
  add_foreign_key "corporate_answers", "attachments"
  add_foreign_key "corporate_answers", "corporate_questions"
  add_foreign_key "corporate_attachments", "entities"
  add_foreign_key "corporate_events", "accounts"
  add_foreign_key "corporate_events", "entities"
  add_foreign_key "corporate_questions", "accounts"
  add_foreign_key "corporate_questions", "entities"
  add_foreign_key "country_geography_mandates", "country_mandates"
  add_foreign_key "country_geography_mandates", "geography_mandates"
  add_foreign_key "distribution_restrictions", "insight_providers"
  add_foreign_key "email_events", "email_receipts"
  add_foreign_key "email_receipts", "group_email_messages"
  add_foreign_key "entities", "companies"
  add_foreign_key "entities", "sector_mandates"
  add_foreign_key "entities_external_reports", "entities"
  add_foreign_key "entities_external_reports", "external_reports"
  add_foreign_key "entities_locker_items", "entities"
  add_foreign_key "entities_locker_items", "locker_items"
  add_foreign_key "entity_discoveries", "entities"
  add_foreign_key "entity_extended_fields", "entities"
  add_foreign_key "entity_extended_fields", "entity_quote_sources"
  add_foreign_key "entity_management_profiles", "entities"
  add_foreign_key "event_reservations", "accounts"
  add_foreign_key "event_reservations", "corporate_events"
  add_foreign_key "exchange_announcement_categories", "exchanges"
  add_foreign_key "exchange_commissions", "companies"
  add_foreign_key "feature_usages", "feature_participants"
  add_foreign_key "insight_analytic_reports", "accounts"
  add_foreign_key "insight_analytic_reports", "companies"
  add_foreign_key "insight_analytic_reports", "insights"
  add_foreign_key "insight_documents", "insights"
  add_foreign_key "insight_provider_payments", "accounts"
  add_foreign_key "insight_purchases", "accounts"
  add_foreign_key "insight_purchases", "insights"
  add_foreign_key "insights", "accounts"
  add_foreign_key "magic_tokens", "accounts"
  add_foreign_key "teams", "companies"
  add_foreign_key "trading_transactions", "companies"
  add_foreign_key "trading_transactions", "counterparties"
  add_foreign_key "trading_transactions", "entities"
  add_foreign_key "trading_transactions", "exchange_commissions"
  add_foreign_key "watched_items", "watchlists"
  add_foreign_key "watchlists", "accounts"
end
