library(vcfR)
library(dplyr)

####
## Find unique variants per barcode to see if these are different samples or contaimination
####

## Get variants
barcode3 <- read.vcfR("./output/variants/barcode3.vcf", verbose = FALSE )
barcode3 <-as.data.frame(barcode3@fix)
barcode3$variant <- paste0(barcode3$POS, "_", barcode3$ALT)
barcode3$QUAL <- as.numeric(barcode3$QUAL)

barcode4 <- read.vcfR("./output/variants/barcode4.vcf", verbose = FALSE )
barcode4 <-as.data.frame(barcode4@fix)
barcode4$variant <- paste0(barcode4$POS, "_", barcode4$ALT)
barcode4$QUAL <- as.numeric(barcode4$QUAL)

barcode6 <- read.vcfR("./output/variants/barcode6.vcf", verbose = FALSE )
barcode6 <-as.data.frame(barcode6@fix)
barcode6$variant <- paste0(barcode6$POS, "_", barcode6$ALT)
barcode6$QUAL <- as.numeric(barcode6$QUAL)

## Get unique variants

barcode3_unique <- 
    barcode3 %>%
    filter(
        !(variant %in% barcode4$variant),
        !(variant %in% barcode6$variant),
        QUAL > 30
    )

barcode4_unique <- 
  barcode4 %>%
  filter(
    !(variant %in% barcode3$variant),
    !(variant %in% barcode6$variant),
    QUAL > 30
  )

barcode6_unique <- 
  barcode6 %>%
  filter(
    !(variant %in% barcode3$variant),
    !(variant %in% barcode4$variant),
    QUAL > 30
  )



