all: us-render-1x.png us-render-2x.png

us-render-1x.png:
	./render-us.py --1x us-render-1x.png

us-render-2x.png:
	./render-us.py --2x us-render-2x.png
