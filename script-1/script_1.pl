#!/bin/perl -w

use Bio::SeqIO;

$inputFile = Bio::SeqIO->new(-file => "sequence_HFE.gb", -format => "genbank");

$outputFile = Bio::SeqIO->new(-file => ">output.fasta", -format => "fasta");


while ($sequence = $inputFile->next_seq() ) {
	my @a = (0..2);
	$revSequence = $sequence->revcom();

	for(@a){
		$translatedSeq = $sequence->translate(-frame => $_);
		$outputFile->write_seq($translatedSeq);

	 	$revTranslatedSeq = $revSequence->translate(-frame => $_);
	 	$outputFile->write_seq($revTranslatedSeq);
    }
}