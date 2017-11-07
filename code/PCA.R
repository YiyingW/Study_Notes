data_matrix <- data %>%
  select(-cond_2) %>%
  as.matrix() %>%
  log2()

species.pca <- prcomp(data_matrix,
                      center = TRUE,
                      scale. = TRUE)


library(ggbiplot)
g <- ggbiplot(species.pca, obs.scale = 1, var.scale = 1,
              groups = data$cond_2, ellipse = TRUE, var.axes = FALSE)
g <- g + scale_color_discrete(name = "")

print(g)

str(species.pca)
PCA_1 <- data.frame(PC1=species.pca[[2]][,1])
PCA_1$name <- rownames(species.pca[[2]])
ggplot(PCA_1, aes(x=reorder(name, -PC1), y=PC1)) +
  geom_bar(stat ="identity") +
  coord_flip() +
  xlab("Species")
