<?php

namespace App\Message;


class XlsxRowMessage
{
    /**
     * @param string[]
     */
    public function __construct(
        private array $content
    )
    {}

    /**
     * @return string[]
     */
    public function getContent(): array
    {
        return $this->content;
    }
}