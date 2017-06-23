class AttachmentsController < ApplicationController
  def show
    attachment = Attachment.find(params[:id])
    authorize attachment, :show?
    send_file attachment.file.path, disposition: :inline
    # recall we mount_uploader AttachmentUploader to :attachment.file
    # so attachment.file though is a string, is converted to an object
    # by CarrierWave and method path can be called on it to generate
    # a url, disposition: :inline tell send_file to display file content
    # in the browser
  end
end
