class Text < ActiveRecord::Base
  attr_accessible :email

def text_input
	@raw_email = email.to_s
end

  def parse_message_id
    message_id = @raw_email.match(/Message-ID: [^>]*>/i)
  end 

  def parse_date
    date = @raw_email.match(/((Date:[^\+|\-]+[\+|\-\d ]+\([a-z]{3}\))|(Date:[^\+|\-]+[\+|\-\d ]+\([a-z]{3}\))|(Date: [^\+|\-]+[\+|\-\d]+))/m)
  end

  def parse_thread_index
    thread_index = @raw_email.match(/Thread-Index:[^=]+==/i)
  end

  def parse_thread_topic
    subject = @raw_email.split('\r').to_s.match(/Thread-Topic: [^\\]*/m)
  end

  def parse_subject
    subject = @raw_email.split('\r').to_s.match(/Subject: [^\\]*/m)

  end

  def parse_to
    to = @raw_email.match(/(To: .*?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}+(>|)(|, )|To:\n.*?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}+(>|)(|, ))/i)
  end

  def parse_from
    from = @raw_email.match(/From: [^>]+>(|, )/i)
  end

  def parse_return_path
    return_path = @raw_email.match(/(Return-Path: ([A-Z0-9\.\_%\+\-]+@[A-Z0-9\.\-\_]+\.[A-Z]{2,4})|(Return-Path:.+?[^>]>)|(Return-Path: [^>]+>))/mi)
  end

  def parse_sender
    from = @raw_email.match(/Sender: /i)
  end

  def parse_content_type
    @content_type = @raw_email.match(/Content-Type: [^=]+=[^\s]+/i)
  end

  def parse_content_transfer_encoding
    content_transfer_encoding = @raw_email.match(/Content-transfer-encoding: (base64|quoted-printable|8bit|binary|x-token|7bit)/i)
  end

  def parse_mime_version
    mime_version = @raw_email.match(/Mime-version: \d\.\d/i)
  end
  
  def parse_user_agent
    user_agent = @raw_email.match(/User-Agent:\s\S+/i)
  end

  def parse_authentication_results
    user_agent = @raw_email.match(/Authentication-Results: (.*)/)
  end

  def parse_organization
    organization = @raw_email.match(/(Organization: .*)/i)
    organization = organization[1] if organization
  end

  def parse_resent_message_id
    resent_message_id = @raw_email.match(/Resent-Message-Id: [^<]*<[^>]*>/i)
  end

  def parse_resent_from
    parse_resent_from = @raw_email.match(/Resent-From: [A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
  end

  def parse_reply_to
    parse_reply_to = @raw_email.match(/Reply-To: [^>]+> /i)
  end

  def parse_references
    parse_references = @raw_email.match(/References: [^>]+>[^>]+>/i)
  end

  def parse_in_reply_to
    parse_in_reply_to = @raw_email.match(/In-Reply-To: [^>]+>/i)
  end

  def parse_cc
    parse_cc = @raw_email.match(/(CC: .*?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}+(>|)(|, )|CC:\n.*?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}+(>|)(|, ))/i)
  end

  def parse_bcc
    parse_bcc = @raw_email.match(/(BCC: .*?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}+(>|)(|, )|BCC:\n.*?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}+(>|)(|, ))/i)
  end

  def parse_x_sender
    parse_x_sender = @raw_email.match(/X-Sender: [A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
  end

  def parse_x_mailer
    parse_x_mailer = @raw_email.match(/X-Mailer: (.*?)\n/i)
  end

     def parse_dkim_signature
    parse_dkim_signature = @raw_email.match(/DKIM-Signature: [^>]*[^=]*==/i)
  end

  def parse_domain_key_signature
    parse_domain_key_signature = @raw_email.match(/DomainKey-Signature: [^>]*[^=]*=;/i)
  end

  def parse_message_state
    parse_message_state = @raw_email.match(/Message-State: [a-z0-9\/]+/mi)
  end

  def parse_received_by
    parse_received_by = @raw_email.match(/Received: by [^;]+;[^)]+\)/i)
  end

  def parse_received_from
    parse_received_from = @raw_email.match(/Received: from [^;]+;[^-|\+]+[+\|-]+\d+/i)
  end

  def parse_x_original_arrival_time
    parse_x_raw_arrival_time = @raw_email.match(/X-OriginalArrivalTime: [^\]]+\]/i)
  end

  def parse_x_apparently_to
    parse_x_apparently_to = @raw_email.match(/(X-Apparently-To:[^\-|\+]+[\-|\+\d+]+)/im)
  end

   def parse_x_originating_ip
    parse_x_apparently_to = @raw_email.match(/(X-Originating-IP: [^\]]+\])/im)
  end

  def parse_accept_language
    parse_accept_language = @raw_email.match(/(Accept-Language: ([a-z]{0,2}\-[a-z]{0,3}))/im)
  end

  def parse_content_language
    parse_content_language = @raw_email.match(/(Content-Language: ([a-z]{0,2}\-[a-z]{0,3}))/im)
  end

  def parse_received_spf
    parse_received_spf = @raw_email.match(/Received-SPF: pass [^;]+;/i)
  end

  def parse_x_originator_org
    parse_x_originator_org = @raw_email.match(/X-OriginatorOrg: [A-Z0-9.-]+\.[A-Z]{2,4}/i)
  end

  def parse_body
     @parse_body = @raw_email.match(/(\r\n\r\n[\W\w\S\s\D\d\b]*\r\n)/i)
  end

end
