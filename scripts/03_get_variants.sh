


bcftools mpileup --max-depth 1000 -Ou -f ./data/ref/hrv_a101.fasta \
./output/processed_data/aligned_reads/barcode03.sorted.aligned.bam | \
bcftools call -mv -Ob -o ./output/variants/barcode3.bcf

bcftools view./output/variants/barcode3.bcf > ./output/variants/barcode3.vcf

bcftools mpileup --max-depth 1000 -Ou -f ./data/ref/hrv_a101.fasta \
./output/processed_data/aligned_reads/barcode04.sorted.aligned.bam | \
bcftools call -mv -Ob -o ./output/variants/barcode4.bcf

bcftools view./output/variants/barcode4.bcf > ./output/variants/barcode4.vcf

bcftools mpileup --max-depth 1000 -Ou -f ./data/ref/hrv_a101.fasta \
./output/processed_data/aligned_reads/barcode06.sorted.aligned.bam | \
bcftools call -mv -Ob -o ./output/variants/barcode6.bcf

bcftools view./output/variants/barcode6.bcf > ./output/variants/barcode6.vcf