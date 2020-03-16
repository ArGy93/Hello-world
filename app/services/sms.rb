class Sms
  def self.send(number, text)
    if Rails.env != 'production'
      write_to_file(number, text)
    else
      send_sms(number, text)
    end
  end

  def self.write_to_file(number, text)
    file = File.new(Rails.public_path + 'pwd.txt', 'w')
    file.syswrite(text)
    file.close
  end

  def self.send_sms(number, text)
    begin
      url = 'http://smsc.ru/sys/send.php?' +
            "login=#{ENV['SMS_LOGIN']}&psw=#{ENV['SMS_PASSWORD']}" +
            "&phones=#{number}&mes=#{CGI.escape(text)}"
      Rails.logger.debug url
      response = HTTParty.get url
      Rails.logger.debug response.inspect
    rescue StandardError => ex
      Rails.logger.error ex.message
    end
  end
end
