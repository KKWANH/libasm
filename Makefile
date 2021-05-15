# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kkim <kkim@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/10 08:34:23 by kimkwanho         #+#    #+#              #
#    Updated: 2021/05/12 13:28:14 by kkim             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libasm.a

NASM	=	nasm
NFLG	=	-f macho64

NSRC	=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s
NOBJ	=	$(NSRC:.s=.o)

TEST	=	test

%.o		:	%.s
			nasm -f macho64 $<

# BSRC	=	ft_list_size_bonus.s \
# 			ft_list_push_front_bonus.s \
# 			ft_list_remove_if_bonus.s \
# 			ft_list_sort_bonus.s
# NOBJ	=	$(NSRC:.s=.o)

all		:	$(NAME)
			

$(NAME)	:	$(NOBJ)
			ar rc $(NAME) $(NOBJ)

clean	: 	
			rm -rf $(NOBJ)

fclean	:	clean
			rm -rf $(NAME) $(TEST) $(NAME)

re		:	fclean all