module Ruboty module Handlers
	class ThroughRubotyName < Base
		on(
			/(?<text>.+)/,
			name: "all",
			description: "Receive for '{RUBOTY_NAME} text'",
			all: true
		)
		def all message
			text = message[:text]
			name = robot.name

			return if text =~ /^#{name}\s.+/
			robot.receive(message.original.merge({body: "#{name} #{text}"}))
		end
	end
end end
