# https://vstark.net/2015/06/22/http-proxy-rails/

class XKCDProxy < Rack::Proxy
  def rewrite_env(env)
    env['HTTP_HOST'] = 'xkcd.com'
    env['SERVER_PORT'] = 80

    # Remove forwarding parameters
    env['SCRIPT_NAME'] = nil
    env['HTTP_X_FORWARDED_PORT'] = "443"
    env['HTTP_X_FORWARDED_PROTO'] = "https"

    # Do some other stuff as needed
    # ...

    # Return the 'env'
    env
  end

  def rewrite_response(triplet)
    status, headers, body = triplet

    # example of inserting an additional header
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Request-Method"] = "*"

    triplet
  end
end