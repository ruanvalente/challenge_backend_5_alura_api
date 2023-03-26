json.array!(@videos) do |video|
  json.id video.id
  json.categoriaId video.category_id
  json.titulo video.title
  json.descricao video.description
  json.url video.url
end