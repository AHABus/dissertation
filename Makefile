CXX = pdflatex
BIB = biber
TARGET = paper

all: open

compile:
	@$(CXX) -shell-escape $(TARGET).tex
	@$(BIB) $(TARGET) > /dev/null
	@$(CXX) -shell-escape $(TARGET).tex > /dev/null
	@$(CXX) -shell-escape $(TARGET).tex > /dev/null
	@clear

open: compile
	@open $(TARGET).pdf

count:
	@texcount -nosub paper.tex

clean:
	@rm -rf *.aux
	@rm -rf *.xml
	@rm -rf *.out
	@rm -rf *.lot
	@rm -rf *.lof
	@rm -rf *.blg
	@rm -rf *.bcf
	@rm -rf *.bbl
	@rm -rf *.log
	@rm -rf *.toc
	@rm -rf _minted-$(TARGET)