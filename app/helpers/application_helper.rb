module ApplicationHelper
  def default_meta_tags
    {
      description: "ページのディスクリプション、PC120文字以内、スマホ70文字以内",
      author: "ページの作成者",
      viewport: "width=device-width, initial-scale=1.0",
      keywords: "rails,seo,meta-tags",
      noindex: ! Rails.env.production?,
	    canonical: request.original_url,
      charset: "UTF-8",
      og: {
        title: "ページのタイトル",
        description: "ページのディスクリプション。website,blogなど",
        type: "ページの種類",
        url: request.original_url,
        site_name: "サイト名",
        image: "サムネイル画像のURL",
      },
      twitter: {
        card: 'summary',
      }
	  }
  end
end
