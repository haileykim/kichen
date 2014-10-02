module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase unless user.blank?
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

# check if the given url has http protocol and if not, append it  
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def full_name_of(user)
  	user.first_name + ' ' + user.last_name unless user.first_name.blank? && user.last_name.blank?
  end
end