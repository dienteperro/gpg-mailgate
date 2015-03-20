require 'spec_helper'

RSpec.describe GpgMailgate do
  it 'should encrypt given message' do
    message = "Date: Fri, 20 Mar 2015 21:28:24 +0100\r\n" \
              "From: test-from@example.com\r\n" \
              "To: test-to@example.com\r\n" \
              "Message-ID: <test-123@example>\r\n" \
              "Subject: test message\r\n" \
              "Mime-Version: 1.0\r\n" \
              "Content-Type: text/plain;\r\n charset=UTF-8\r\n" \
              "Content-Transfer-Encoding: 7bit\r\n\r\n" \
              'lorem ipsum dolor sit amet'
    encrypted_message = GpgMailgate.encrypt(message)
    encrypted_mail = Mail.new(encrypted_message)

    expect(encrypted_mail.encrypted?).to be_truthy
    expect(encrypted_mail.decrypt(password: '').to_s).to eq message
  end
end