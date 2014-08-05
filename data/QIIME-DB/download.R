#!/usr/bin/env Rscript

# download an experiment from the QIIME database
# given a QIIME id and save as a phyloseq object
# in an Rdata file.

# requirements: phyloseq, optparse

library(optparse)

opts <- c(make_option('--id', type='numeric'),
          make_option('--output'))

opts <- parse_args(OptionParser(option_list = opts))

library(phyloseq)


download_experiment <- function(id, out) {
  message('Downloading experiment ID', id)
  for (extension in c('.tgz', '.gz', '.zip')) {
    tryCatch(
      phy <- microbio_me_qiime(id, ext=extension),
      error = function(e) {
        cat("extension", extension, "didn't work, trying again.\n")
      }
    )
  }
  cat(phy)
  save(phy, file=out)
}

download_experiment(opts$id, opts$output)
