import harrixpyssg as hsg


def main():
    markdown_paths = ['C:\Harrix\GitHub\harrix.dev\src\_posts']
    output_path = './dist'
    hsg.StaticSiteGenerator(markdown_paths, output_path).start()


if __name__ == '__main__':
    main()