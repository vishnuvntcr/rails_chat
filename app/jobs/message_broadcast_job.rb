class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(msg)
  	ActionCable.server.broadcast 'room_channel', message: render_message(msg)
  end

  private
  def render_message(message)
  	ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
