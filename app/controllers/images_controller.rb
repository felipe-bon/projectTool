class ImagesController < ApplicationController

    def show
        send_file Rails.root.join('public', 'assetsReadme', 'projectToolimg.png'), type: 'image/png', disposition: 'inline'
    end

end
