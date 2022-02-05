[文章地址](https://www.techrxiv.org/articles/preprint/Deep_Clustering_with_Self-supervision_using_Pairwise_Data_Similarities/14852652/2)

![](http://kuroweb.tk/picture/16432728911190016.jpg)

# main idea

1. first use auto encoder to create an hypersphere like clustering based on latent space

2. employs pairs of similar and dissimilar samples to create the K-dimensional space q in which pairwise similarities and dissimilarities are strengthen

# author ideas

# How to compute cluster loss?

Calculating the true clustering loss is impossible due to the unsupervised nature of the clustering problem where the true cluster label of the data points remains unknown during the training phase.
Hence, researchers employ an approximation of the clustering losses when training the networks

# terms explanation

- Crisp assignment
  purpose: assigns a data point to only one cluster

disadvantages:

[mislead](https://www.jansellner.net/showcase/Crisp_vs._fuzzy_k-means_clustering) the training procedure if significant number of samples are mis-clustered, especially When the case where a data point is equally close to all cluster centers, as **error propagates**



- soft assignment

Every data point belongs to some degree to every cluster centre

- metric learning algorithms

goal is to decrease the
distance between similar samples