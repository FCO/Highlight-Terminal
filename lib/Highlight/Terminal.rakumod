unit role Highlight::Terminal;

method map(--> Map()) {
	adverb-q            => "1",
	adverb-q-xxx        => Str,
	arrow               => "35;1",
	arrow-one           => Str,
	arrow-two           => Str,
	block               => "35",
	block-xxx           => Str,
	capture             => "34;1",
	capture-named       => Str,
	capture-xxx         => Str,
	comment             => "30;2",
	constraint          => "33;2",
	constraint-xxx      => Str,
	core                => "33;1",
	core-say            => Str,
	core-xxx            => Str,
	doc                 => "30;1;3",
	doc-xxx             => Str,
	infix               => "33;1",
	infix-xxx           => Str,
	invocant            => "30;1",
	label               => "38;1",
	literal             => "32",
	markup              => "3",
	markup-xxx          => Str,
	meta                => "31;1",
	meta-xxx            => Str,
	modifier            => "1",
	modifier-xxx        => Str,
	multi               => "32;1",
	multi-xxx           => Str,
	named               => "37;3",
	named-xxx           => Str,
	nqp                 => "31;4",
	nqp-xxx             => Str,
	package             => "32;1;4",
	package-xxx         => Str,
	param               => "32;1",
	phaser              => "30;47;1;3;4",
	phaser-xxx          => Str,
	postfix             => "33;1",
	postfix-xxx         => Str,
	pragma              => "33;1;2;3",
	pragma-xxx          => Str,
	prefix              => "33;1",
	prefix-xxx          => Str,
	quote-lang          => "33;3",
	quote-lang-xxx      => Str,
	rakudoc             => "37;2;3",
	rakudoc-xxx         => Str,
	regex               => "1;3",
	regex-xxx           => Str,
	routine             => "32;1",
	routine-xxx         => Str,
	scope               => "34;1",
	scope-xxx           => Str,
	smiley              => "33;1;3",
	smiley-xxx          => Str,
	stmt                => Str,
	stmt-prefix         => "32;1",
	stmt-prefix-xxx     => Str,
	stub                => "37;2",
	system              => "31;3;4",
	system-xxx          => Str,
	term                => "33;1",
	term-xxx            => Str,
	ternary             => "31;1;3",
	ternary-xxx         => Str,
	trait-is            => "3",
	trait-is-xxx        => Str,
	traitmod            => "1;3;4",
	traitmod-xxx        => Str,
	type                => "37;1",
	type-xxx            => Str,
	typer               => "37;1",
	typer-xxx           => Str,
	use                 => "33;1;3;4",
	use-xxx             => Str,
	var                 => "33;1",
	var-attribute       => Str,
	var-compiler        => Str,
	var-dynamic         => Str,
	var-implicit        => Str,
	var-lexical         => Str,
	var-package         => Str,
	var-placeholder     => Str,
	var-rakudoc         => Str,
	var-setting         => Str,
	var-term            => Str,
	version             => "33;4",
}

method hsyn(str $type, str $content) { $.hl: $type, $content }

multi method hl($type where {!$.from-map: $_}, $content) {
	$content
}

multi method hl($type where {$.from-map: $_ }, $content) {
	"\o33[{ $.from-map: $type }m$content\o33[m"
}

method from-map($type) {
	%.map{
		$type.split("-")
			.produce(-> $agg, $item {
				"{$agg}-{$item}"
			})
			.reverse
	}
		.first(*.defined)
}

=begin pod

=head1 NAME

Highlight::Terminal - Highlight code using terminal colors

=head1 SYNOPSIS

=begin code :lang<raku>

use Highlight::Terminal;

say Q"my $bla = 42; for $bla/2 .. $bla { .say }".AST.DEPARSE: Highlight::Terminal;

=end code

![Highlighted code](highlighted.png)

=head1 DESCRIPTION

Highlight::Terminal is a way to highlight Raku code using C<RakuAST> and terminal colors.

=head1 TODO

=item Improve default theme
=item Make layout customisable

=head1 AUTHOR

Fernando Corrêa de Oliveira <fernando.correa@humanstate.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2024 Fernando Corrêa de Oliveira

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
