#Image import

Simple script to import photos from camera card.

Copy images from current directory to sub-directories by file create date (YYYY-MM-DD).

#Installation

  `$ curl https://raw.githubusercontent.com/elementoss/image-import/master/imageimport.sh > imageimport.sh && 
    chmod 755 imageimport.sh && 
    sudo mv imageimport.sh /usr/local/bin/`

#Usage

Organize images in current directory.

`imageimport.sh`

Copy images from path

`imageimport.sh -f PATH`

Copy images to path

`imageimport.sh -t PATH`

Moves images instead copy

`imageimport.sh -m`
