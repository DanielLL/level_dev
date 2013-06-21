require 'colorize'

namespace :roles do
  desc "assigns admin role to developer's given email address"
  task :assign_to_admin, [:developer_email] => :environment do |t, args|
    developer = Developer.where(:email => args.developer_email).last rescue nil
    if developer
      developer.update_attributes(admin: true)
      puts "#{developer.email} was successfully added to the admin role".green
    else
      email_not_found(args.developer_email)
    end
  end

  desc "removes admin role to developer's given email address"
  task :remove_from_admin, [:developer_email] => :environment do |t, args|
    developer = Developer.where(:email => args.developer_email).last rescue nil
    if developer
      developer.update_attributes(admin: false)
      puts "#{developer.email} was successfully removed from admin role".green
    else
      email_not_found(args.developer_email)
    end
  end


  def email_not_found(email)
    puts "Any developer with ".red + "#{email} ".yellow + "email was found".red
  end
end
