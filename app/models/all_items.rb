class AllItems

  SELECT_ALL_ITEMS = "SELECT * FROM "\
  "(SELECT i.id, i.created_time as created, \'instagrams\' as \'table\' FROM instagrams as i "\
  "UNION ALL "\
  "SELECT t.id, t.created_at as created, \'tweets\' as \'table' FROM tweets as t "\
  "UNION ALL "\
  "SELECT y.id, y.publishedAt AS created, \'youtube\' as \'table\' FROM youtube as y) "\
  "as  all_tables_by_date ORDER BY created DESC;"

  SELECT_TWEET_ITEM = "SELECT id, created_at as created, text, user_id, user_name as user_fullname, user_screen_name as username, user_profile_image_url_https as profile_image, media_type, media_url_https as media_url FROM tweets WHERE id = ?";
  SELECT_INSTAGRAM_ITEM = "SELECT id, created_time as created, caption_text as text, link, user_id, user_full_name as user_fullname, user_username as username, user_profile_picture as profile_image, type as media_type, images_thumbnail as image_thumb, images_low_resolution as image_lowres, images_standard_resolution as image_std, videos_low_bandwidth as video_lowband, videos_low_resolution as video_lowres, videos_standard_resolution as video_std FROM instagrams WHERE id = ?";
  SELECT_YOUTUBE_ITEM = "SELECT id, publishedAt as created, title as text, channel_id as user_id, authorName as user_fullname, channelTitle as username, profile_picture as profile_image, 'video' as media_type, thumbnail_high as media_url, link FROM youtube WHERE id = ?";

  def initialize
    config = YAML.load(ERB.new(File.read("config/database.yml")).result)[Rails.env]
    @client = Mysql2::Client.new(config)
  end

  def selectLatestIds
    @client.query("#{SELECT_ALL_ITEMS}")
  end

  def getLatestItems

    latestItems = Array.new

    selectLatestIds.each do |item|

      sqlStmt = getSqlStmt(item["table"])

      if sqlStmt == nil
        next
      end

      statement = @client.prepare(sqlStmt)
      result = statement.execute(item["id"])

      result.each do |row|
        row["item_type"] = item["table"]

        # Convert it all to strings
        row.each do |key, val|
          row[key] = row[key].to_s
        end

        latestItems << row
      end

    end

    latestItems
  end

  def getSqlStmt(tableName)


    case tableName
    when "tweets"
      SELECT_TWEET_ITEM
    when "instagrams"
      SELECT_INSTAGRAM_ITEM
    when "youtube"
      SELECT_YOUTUBE_ITEM
    else
      nil
    end

  end

end
